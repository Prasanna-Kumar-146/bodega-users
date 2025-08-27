import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = screenWidth < 600 ? 28.0 : 32.0;
    final mapHeight = screenWidth < 600 ? 200.0 : 300.0;
    final fontSizeLetter = screenWidth < 600 ? 32.0 : 36.0;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products',
                  hintStyle: const TextStyle(color: Color(0xFF544F94)),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF544F94)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color(0xFFE8E8F2),
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
            const SizedBox(height: 16),
            Container(
              height: mapHeight,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.blue.withOpacity(0.1),
                  width: 1,
                ),
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
            const SizedBox(height: 16),
            _buildVendorItem('B', 'Bharath Mart', 4.5, '25-35min', '5km', avatarRadius, fontSizeLetter),
            _buildVendorItem('O', 'Onkar Lalaso Mart', 4.1, '10-15min', '900m', avatarRadius, fontSizeLetter),
            _buildVendorItem('D', 'Dhruvesh Ali Mart', 4.4, '5-10min', '500m', avatarRadius, fontSizeLetter),
            _buildVendorItem('E', 'Eshwar Mart', 5.0, '10-12min', '1km', avatarRadius, fontSizeLetter),
            _buildVendorItem('G', 'G.V.Prasanna Kumar Mart', 4.5, '7-14min', '1.2km', avatarRadius, fontSizeLetter),
            _buildVendorItem('A', 'Anjali Mart', 4.0, '40-55min', '20km', avatarRadius, fontSizeLetter),
            const SizedBox(height: 80),
          ],
        ),
      ),
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
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
      leading: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF544F94),
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
          const Icon(Icons.star, color: Color(0xFF544F94), size: 18),
          const SizedBox(width: 4),
          Text('$rating', style: const TextStyle(fontSize: 14, color: Colors.black87)),
          const SizedBox(width: 12),
          const Icon(Icons.access_time, color: Color(0xFF544F94), size: 18),
          const SizedBox(width: 4),
          Text(time, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          const SizedBox(width: 12),
          const Icon(Icons.location_on, color: Color(0xFF544F94), size: 18),
          const SizedBox(width: 4),
          Text(distance, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }
}
