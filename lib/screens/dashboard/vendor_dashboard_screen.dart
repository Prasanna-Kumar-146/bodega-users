import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'products_screen.dart';
import 'voice_assistant_screen.dart';
import 'vendors_screen.dart';
import 'cart_screen.dart';

class VendorDashboardScreen extends StatefulWidget {
  const VendorDashboardScreen({super.key});

  @override
  State<VendorDashboardScreen> createState() => _VendorDashboardScreenState();
}

class _VendorDashboardScreenState extends State<VendorDashboardScreen> {
  int _currentIndex = 3; // Default to Vendors screen as per the screenshot

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProductsScreen(),
    const VoiceAssistantScreen(),
    const VendorsScreen(),
    const CartScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.only(top: 24, left: 15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF544F94),
          ),
          child: const Center(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        title: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  alignment: Alignment.center,
                  child: const Text(
                    'Bodega',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 75, left: 15),
              child: SizedBox(
                width: 290,
                height: 39,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for products',
                    hintStyle: const TextStyle(color: Color(0xFF544F94)),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF544F94)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6A1B9A), // Purple color from image
        unselectedItemColor: const Color(0xFF757575), // Grey color from image
        backgroundColor: Colors.white,
        elevation: 8.0, // Slight elevation for shadow effect
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 24, color: Color(0xFF544F94)),
          activeIcon: Icon(Icons.home, size: 24, color: Colors.black),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list, size: 24, color: Color(0xFF544F94)), // Default color
          activeIcon: Icon(Icons.list, size: 24, color: Colors.black), // Active color
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.multitrack_audio, size: 24, color: Color(0xFF544F94)),
          activeIcon: Icon(Icons.multitrack_audio, size: 24, color: Colors.black),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store, size: 24, color: Color(0xFF544F94)),
          activeIcon: Icon(Icons.store, size: 24, color: Colors.black),
          label: 'Vendors',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, size: 24, color: Color(0xFF544F94)), // Default color
          activeIcon: Icon(Icons.shopping_cart, size: 24, color: Colors.black), // Active color
          label: 'Cart',
        ),
        ],
      ),
    );
  }
}