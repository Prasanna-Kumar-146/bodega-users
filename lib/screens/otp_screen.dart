import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dashboard/vendor_dashboard_screen.dart'; // Updated import

class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  const OTPScreen({super.key, required this.mobileNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpControllers = List.generate(6, (_) => TextEditingController());
  bool isResendEnabled = true;
  int countdown = 30;
  Timer? timer;

  String maskedMobile() {
    if (widget.mobileNumber.length >= 4) {
      final visible = widget.mobileNumber.substring(
        widget.mobileNumber.length - 4,
      );
      return 'XXXXXXXX$visible';
    }
    return widget.mobileNumber;
  }

  void startTimer() {
    setState(() {
      isResendEnabled = false;
      countdown = 30;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (countdown <= 1) {
        t.cancel();
        setState(() {
          isResendEnabled = true;
        });
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  void resendOTP() {
    print("Resending OTP to ${widget.mobileNumber}");
    startTimer();
    // TODO: Integrate backend API here
  }

  void verifyOTP() {
    final otp = otpControllers.map((c) => c.text.trim()).join();
    const mockValidOTP = "123456";
    if (otp == mockValidOTP) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const VendorDashboardScreen(),
        ), // Updated navigation
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid OTP. Please try again."),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    timer?.cancel();
    super.dispose();
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isWide ? 500 : double.infinity,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Almost there",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.69,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Please enter the 6-digit code sent to your mobile number ${maskedMobile()} for verification.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.07,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 40,
                        child: TextField(
                          controller: otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                            border: OutlineInputBorder(),
                          ),
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                index < otpControllers.length - 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: verifyOTP,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF221662),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Didn’t receive any code?",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: isResendEnabled ? resendOTP : null,
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      "Resend Again",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12,
                        color: isResendEnabled
                            ? const Color(0xFF6A1B9A)
                            : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Request new code in 00: ${countdown.toString().padLeft(2, '0')}s",
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      color: Color(0x80000000),
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
