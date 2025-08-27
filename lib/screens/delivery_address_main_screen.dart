import 'package:flutter/material.dart';
import '../utils/font_styles.dart';

class DeliveryAddressMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isWide ? 500 : double.infinity),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row: Profile Icon + Bodega Title
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
                          uniquifier: 'header',
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 32.0),

                  // Delivery Address Heading
                  Text(
                    'Delivery Address',
                    style: PlusJakartaSansStyle.getStyle(
                      weight: 700,
                      uniquifier: 'header',
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  // Options List
                  Column(
                    children: [
                      _buildOptionTile(context, 'Delivery address', '/delivery_address_sub'),
                      const SizedBox(height: 12.0),
                      _buildOptionTile(context, 'Saved locations (Home, Work, etc.)', '/saved_locations'),
                      const SizedBox(height: 12.0),
                      _buildOptionTile(context, 'Pin-drop map integration', '/location'),
                    ],
                  ),
                  const SizedBox(height: 32.0),

                  // Back Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(67.34, 38.0),
                      maximumSize: const Size(384.8, 38.0),
                      padding: const EdgeInsets.symmetric(horizontal: 16.03),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.62),
                      ),
                      backgroundColor: const Color(0xFF221662),
                    ),
                    child: Text(
                      'Back',
                      textAlign: TextAlign.center,
                      style: PlusJakartaSansStyle.getStyle(
                        weight: 700,
                        uniquifier: 'button',
                        fontSize: 12.83,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: double.infinity,
        height: 39.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFFE8E8F2),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 9.0, left: 9.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: PlusJakartaSansStyle.getStyle(
                weight: 400,
                uniquifier: 'input',
                fontSize: 13.01,
                color: const Color(0xFF544F94),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
