import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/delivery_address_main_screen.dart';
import 'screens/delivery_address_screen.dart';
import 'screens/saved_locations_screen.dart';
import 'screens/location_screen.dart';
import 'screens/dashboard/vendor_dashboard_screen.dart'; // ✅ Add this if you have a vendor page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bodega App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/profile': (context) => const UserProfileScreen(),
        '/delivery_address_main': (context) => DeliveryAddressMainScreen(),
        '/delivery_address_sub': (context) => const DeliveryAddressScreen(),
        '/saved_locations': (context) => SavedLocationsScreen(),
        '/location': (context) => LocationScreen(),
        '/vendor': (context) => const VendorDashboardScreen(),
      },
    );
  }
}
