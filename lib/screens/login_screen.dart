import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/rounded_button.dart';
import '../utils/validators.dart';
import '../utils/helpers.dart';
import 'next_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();

  void loginWithMobile() {
    final mobile = mobileController.text.trim();

    if (!isValidPhone(mobile)) {
      showSnackBar(context, "Please enter a valid mobile number");
      return;
    }

    showSnackBar(context, "Login requested for $mobile");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NextScreen()),
    );
  }

  void goToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: mobileController,
              label: "Mobile Number", // ✅ Added label
              hintText: "Enter mobile number",
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            RoundedButton(
              title: "Login",
              onPressed: loginWithMobile,
              backgroundColor: Colors.blue,
              textColor: Colors.white, // ✅ Added textColor
            ),
            const SizedBox(height: 12),
            RoundedButton(
              title: "Signup",
              onPressed: goToSignup,
              backgroundColor: Colors.green,
              textColor: Colors.white, // ✅ Added textColor
            ),
          ],
        ),
      ),
    );
  }
}

// Optional placeholder screen
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: const Center(
        child: Text("Signup screen content goes here"),
      ),
    );
  }
}