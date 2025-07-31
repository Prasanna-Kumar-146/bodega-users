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
    if (!isValidPhone(mobileController.text)) {
      showSnackBar(context, "Please enter a valid mobile number");
      return;
    }

    // Optional: Show confirmation
    showSnackBar(context, "Login requested for ${mobileController.text}");

    // ✅ Redirect to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NextScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              "Enter your mobile number",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 40),
            CustomTextField(
              label: "Mobile Number",
              controller: mobileController,
              keyboardType: TextInputType.phone,
              prefixText: "+91 ",
            ),
            SizedBox(height: 24),
            RoundedButton(
              title: "Login",
              onPressed: loginWithMobile,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
            ),
            Spacer(),
            Text(
              "By continuing, you agree to our Terms of Service and Privacy Policy.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
