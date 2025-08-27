import 'package:flutter/material.dart';
import '../utils/font_styles.dart';

class SavedLocationsScreen extends StatefulWidget {
  @override
  _SavedLocationsScreenState createState() => _SavedLocationsScreenState();
}

class _SavedLocationsScreenState extends State<SavedLocationsScreen> {
  List<Map<String, String>> locations = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenWidth < 420 ? screenWidth * 0.9 : 384.8,
            child: Stack(
              children: [
                // Profile Picture
                Positioned(
                  top: 24.0,
                  left: 16.0,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56.0),
                      color: Colors.grey,
                    ),
                  ),
                ),

                // Bodega Text
                Positioned(
                  top: 27.0,
                  left: screenWidth * 0.35,
                  child: Text(
                    'Bodega',
                    style: PlusJakartaSansStyle.getStyle(
                      weight: 700,
                      fontSize: 18.0,
                      color: Colors.black,
                      uniquifier: 'header',
                    ),
                  ),
                ),

                // Saved Locations Heading
                Positioned(
                  top: 86.0,
                  left: 16.0,
                  child: Text(
                    'Saved Locations',
                    style: PlusJakartaSansStyle.getStyle(
                      weight: 700,
                      fontSize: 18.0,
                      color: Colors.black,
                      uniquifier: 'header',
                    ),
                  ),
                ),

                // Content Area
                Positioned(
                  top: 139.0,
                  left: 16.0,
                  right: 16.0,
                  child: Container(
                    height: 300.0,
                    child: locations.isEmpty
                        ? Center(
                      child: Text(
                        'There are no saved Locations',
                        style: PlusJakartaSansStyle.getStyle(
                          weight: 700,
                          fontSize: 18.0,
                          color: Color(0xFF221662),
                          uniquifier: 'empty',
                        ),
                      ),
                    )
                        : ListView.builder(
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFFE8E8F2),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    locations[index]['address']!,
                                    style: PlusJakartaSansStyle.getStyle(
                                      weight: 400,
                                      fontSize: 14.0,
                                      color: Color(0xFF544F94),
                                      uniquifier: 'address',
                                    ),
                                  ),
                                  Text(
                                    locations[index]['details']!,
                                    style: PlusJakartaSansStyle.getStyle(
                                      weight: 400,
                                      fontSize: 12.0,
                                      color: Color(0xFF544F94),
                                      uniquifier: 'details',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Back Button
                Positioned(
                  bottom: 24.0,
                  left: 16.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/delivery_address_main');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDFE0E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.62),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.03),
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
                ),

                // Add Location Button
                Positioned(
                  bottom: 24.0,
                  left: 100.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/delivery_address_sub').then((value) {
                        if (value != null && value is Map<String, String>) {
                          setState(() {
                            locations.add(value);
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF221662),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.62),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.03),
                    ),
                    child: Text(
                      'Add Location',
                      style: PlusJakartaSansStyle.getStyle(
                        weight: 700,
                        fontSize: 16.0,
                        color: Colors.white,
                        uniquifier: 'button',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
