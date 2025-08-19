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
        leading: const Icon(Icons.person_outline, color: Colors.black),
        title: const Text('Bodega', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
            icon: Icon(Icons.home, size: 24),
            activeIcon: Icon(Icons.home, size: 24, color: Color(0xFF6A1B9A)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 24),
            activeIcon: Icon(Icons.list, size: 24, color: Color(0xFF6A1B9A)),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.multitrack_audio, size: 24),
            activeIcon: Icon(
              Icons.multitrack_audio,
              size: 24,
              color: Color(0xFF6A1B9A),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store, size: 24),
            activeIcon: Icon(Icons.store, size: 24, color: Color(0xFF6A1B9A)),
            label: 'Vendors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 24),
            activeIcon: Icon(
              Icons.shopping_cart,
              size: 24,
              color: Color(0xFF6A1B9A),
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
