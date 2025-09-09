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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Tappable Profile Icon + Bodega Title
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(56.0),
                            color: const Color(0xFF544F94),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          ),
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
                  const SizedBox(height: 32.0),

                  // Heading
                  Text(
                    'Saved Locations',
                    style: PlusJakartaSansStyle.getStyle(
                      weight: 700,
                      fontSize: 18.0,
                      color: Colors.black,
                      uniquifier: 'header',
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // Location List
                  locations.isEmpty
                      ? Center(
                    child: Text(
                      'There are no saved Locations',
                      style: PlusJakartaSansStyle.getStyle(
                        weight: 700,
                        fontSize: 18.0,
                        color: const Color(0xFF221662),
                        uniquifier: 'empty',
                      ),
                    ),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xFFE8E8F2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  locations[index]['address']!,
                                  style: PlusJakartaSansStyle.getStyle(
                                    weight: 400,
                                    fontSize: 14.0,
                                    color: const Color(0xFF544F94),
                                    uniquifier: 'address',
                                  ),
                                ),
                                Text(
                                  locations[index]['details']!,
                                  style: PlusJakartaSansStyle.getStyle(
                                    weight: 400,
                                    fontSize: 12.0,
                                    color: const Color(0xFF544F94),
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
                  const SizedBox(height: 32.0),

                  // Buttons
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/delivery_address_main');
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
                          backgroundColor: const Color(0xFF221662),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.62),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.03),
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
