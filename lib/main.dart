import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key); // Added Key constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: LoginScreen(), // Use LoginScreen as your home screen
      debugShowCheckedModeBanner: false, // Optional: hide debug banner
    );
  }
}
