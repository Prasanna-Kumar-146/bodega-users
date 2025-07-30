import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../utils/validators.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = "";

  void signup() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (!isValidEmail(email)) {
      setState(() => errorMessage = "Invalid email format.");
      return;
    }

    if (!isValidPassword(password)) {
      setState(() => errorMessage = "Password must be at least 8 characters and include letters, numbers, and special characters.");
      return;
    }

    // Simulate saving data locally
    setState(() => errorMessage = "Signup successful! (Data saved locally)");
    print("Saved Email: $email");
    print("Saved Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(label: "Email", controller: emailController),
            SizedBox(height: 10),
            CustomTextField(label: "Password", obscureText: true, controller: passwordController),
            SizedBox(height: 20),
            ElevatedButton(onPressed: signup, child: Text("Sign Up")),
            SizedBox(height: 10),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}