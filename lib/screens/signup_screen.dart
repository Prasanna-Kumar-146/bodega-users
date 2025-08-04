import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: const Color(0xFF221662),
      ),
      body: const Center(
        child: Text(
          "Signup Screen (blank)",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
