import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = screenWidth < 600 ? 28.0 : 32.0; // Responsive avatar size for mobile/tablet/web
    final mapHeight = screenWidth < 600 ? 200.0 : 300.0; // Adjust map height based on screen width
    final fontSizeLetter = screenWidth < 600 ? 32.0 : 36.0; // Larger letter for wider screens
    final horizontalPadding = screenWidth < 600 ? 16.0 : 32.0; // Increase padding on wider screens

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for products',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  30.0,
                ), // More rounded to match image
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.grey[200],
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
            ),
          ),
        ),
        const Text(
          'Near By',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: mapHeight,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.blue.withOpacity(0.1),
              width: 1,
            ), // Subtle border to match image
          ),
          child: const Center(
            child: Text(
              'Guntur Map',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        _buildVendorItem(
          'B',
          'Bharath Mart',
          4.5,
          '25-35min',
          '5km',
          avatarRadius,
          fontSizeLetter,
        ),
        _buildVendorItem(
          'O',
          'Onkar Lalaso Mart',
          4.1,
          '10-15min',
          '900m',
          avatarRadius,
          fontSizeLetter,
        ),
        _buildVendorItem(
          'D',
          'Dhruvesh Ali Mart',
          4.4,
          '5-10min',
          '500m',
          avatarRadius,
          fontSizeLetter,
        ),
        _buildVendorItem(
          'E',
          'Eshwar Mart',
          5.0,
          '10-12min',
          '1km',
          avatarRadius,
          fontSizeLetter,
        ),
        _buildVendorItem(
          'G',
          'G.V.Prasanna Kumar Mart',
          4.5,
          '7-14min',
          '1.2km',
          avatarRadius,
          fontSizeLetter,
        ),
        _buildVendorItem(
          'A',
          'Anjali Mart',
          4.0,
          '40-55min',
          '20km',
          avatarRadius,
          fontSizeLetter,
        ),
        SizedBox(
          height: 80,
        ), // Extra space for bottom nav visibility on scroll
      ],
    );
  }

  Widget _buildVendorItem(
      String letter,
      String name,
      double rating,
      String time,
      String distance,
      double radius,
      double fontSize,
      ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 0.0,
      ), // Tighter padding to match spacing
      leading: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          color: Colors.blue[50], // Lighter blue to match image tint
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFF544F94),
            ),
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.star,
            color: Color(0xFF544F94),
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            '$rating',
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.access_time,
            color: Color(0xFF544F94),
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            time,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.location_on,
            color: Color(0xFF544F94),
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            distance,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}