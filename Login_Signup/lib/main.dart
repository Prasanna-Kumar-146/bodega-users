import 'package:flutter/material.dart';
import 'package:login_signup/Screens/login_screen.dart';
import 'screens/login_screen.dart' hide LoginScreen;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Signup App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}
