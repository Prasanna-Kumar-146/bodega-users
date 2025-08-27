import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  Widget buildOption(BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE9FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF221662),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Profile Icon + Bodega Text
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
                      const Text(
                        'Bodega',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // User Profile Heading
                  const Text(
                    'User Profile',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Options
                  buildOption(context, 'Account Overview', () {
                    // Future implementation
                  }),
                  buildOption(context, 'Delivery Address', () {
                    Navigator.pushNamed(context, '/delivery_address_main');
                  }),
                  buildOption(context, 'Order History & Reorders', () {
                    // Future implementation
                  }),
                  buildOption(context, 'Wallet & Payments', () {
                    // Future implementation
                  }),
                  buildOption(context, 'Support & Help', () {
                    // Future implementation
                  }),
                  buildOption(context, 'Personal Preferences', () {
                    // Future implementation
                  }),
                  const SizedBox(height: 32),

                  // Back Button to Vendor Page
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/vendor'); // ✅ Explicit navigation
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF221662),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
}
