import 'package:flutter/material.dart';
import 'screens/get_started_screen.dart';

void main() => runApp(GetStartedApp());

class GetStartedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Started',
      home: GetStartedScreen(),
    );
  }
}