import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/rounded_button.dart';
import '../utils/validators.dart';
import '../utils/helpers.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();

  void sendOtp() {
    if (!isValidPhone(mobileController.text)) {
      showSnackBar(context, 'Enter a valid mobile number');
      return;
    }
    showSnackBar(context, 'OTP sent to ${mobileController.text}');
  }

  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              "Create a Free Account",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 32),
            CustomTextField(label: "First Name", controller: firstNameController),
            SizedBox(height: 16),
            CustomTextField(label: "Last Name", controller: lastNameController),
            SizedBox(height: 16),
            CustomTextField(
              label: "Mobile Number",
              controller: mobileController,
              keyboardType: TextInputType.phone,
              prefixText: "+91 ",
            ),
            SizedBox(height: 24),
            RoundedButton(
              title: "Send OTP",
              onPressed: sendOtp,
              backgroundColor: Colors.deepPurpleAccent,
              textColor: Colors.white,
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: navigateToLogin,
              child: Text.rich(
                TextSpan(
                  text: "Already a member? ",
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
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