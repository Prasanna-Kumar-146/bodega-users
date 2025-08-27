import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geo;
import '../utils/font_styles.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController mapController;
  LatLng _selectedLocation = const LatLng(17.3850, 78.4867); // Default: Hyderabad
  String _address = 'Select a location on the map';
  Marker? _marker;

  @override
  void initState() {
    super.initState();
    _updateMarker(_selectedLocation);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _updateMarker(LatLng newPosition) async {
    setState(() {
      _selectedLocation = newPosition;
      _marker = Marker(
        markerId: MarkerId('selected-location'),
        position: newPosition,
        draggable: true,
        onDragEnd: (newPosition) => _getAddress(newPosition),
      );
    });
    _getAddress(newPosition);
  }

  void _getAddress(LatLng position) async {
    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        geo.Placemark place = placemarks.first;
        setState(() {
          _address = '${place.street}, ${place.locality}, ${place.postalCode}';
        });
      }
    } catch (e) {
      setState(() {
        _address = 'Address not found';
      });
    }
  }

  void _saveLocation() {
    final newLocation = {
      'address': _address,
      'details': 'FYAAF - ${_address.split(',').last.trim()}',
    };
    Navigator.pop(context, newLocation);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isWide ? 500 : double.infinity),
              child: Column(
                children: [
                  // Top Row: Profile + Title
                  Row(
                    children: [
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56.0),
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Bodega',
                        style: PlusJakartaSansStyle.getStyle(
                          weight: 700,
                          fontSize: 18.0,
                          color: Colors.black,
                          uniquifier: 'header',
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // Map + Address
                  Container(
                    height: 400.0,
                    child: Stack(
                      children: [
                        GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _selectedLocation,
                            zoom: 14.0,
                          ),
                          onTap: _updateMarker,
                          markers: _marker != null ? {_marker!} : {},
                          onCameraMove: (position) {
                            _updateMarker(position.target);
                          },
                        ),
                        Positioned(
                          top: 10.0,
                          left: 10.0,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.white.withOpacity(0.8),
                            child: Text(
                              _address,
                              style: PlusJakartaSansStyle.getStyle(
                                weight: 400,
                                fontSize: 14.0,
                                color: const Color(0xFF544F94),
                                uniquifier: 'address',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // Buttons
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDFE0E2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.62),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.03),
                        ),
                        child: Text(
                          'Back',
                          style: PlusJakartaSansStyle.getStyle(
                            weight: 700,
                            fontSize: 16.0,
                            color: Colors.black,
                            uniquifier: 'button',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: _saveLocation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF221662),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.62),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.03),
                        ),
                        child: Text(
                          'Save',
                          style: PlusJakartaSansStyle.getStyle(
                            weight: 700,
                            fontSize: 16.0,
                            color: Colors.white,
                            uniquifier: 'button',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
