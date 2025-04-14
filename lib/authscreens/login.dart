import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/dashboard.dart';
import 'package:krl/usersideApp/bottomBar.dart';
import 'package:krl/utils/colors.dart';
import 'package:krl/commanwidgets/buttonscomman.dart';
import 'package:krl/utils/hieghtwidth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  void _validateFields() {
    setState(() {
      _isButtonEnabled =
          _emailController.text.contains("@") &&
          _passwordController.text.length >= 6;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateFields);
    _passwordController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login to Your Account",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your registered email and password",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                _buildInputField(
                  "Email",
                  _emailController,
                  false,
                  'Enter Email',
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  "Password",
                  _passwordController,
                  true,
                  'Enter Password',
                ),
                const Spacer(),
                CommonNextButton(
                  isEnabled: _isButtonEnabled,
                  label: 'Login',
                  onPressed: () {
                    if (_isButtonEnabled) {
                      print("Email: ${_emailController.text}");
                      print("Password: ${_passwordController.text}");

                      Get.offAll(() => DashBoard());
                    }
                  },
                ),
                15.height,
                CommonNextButton(
                  isEnabled: true,
                  label: 'User Side Login',
                  onPressed: () {
                    Get.offAll(() => UserDashboardScreen());
                  },
                ),
                30.height,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    bool isPassword,
    String hint,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            keyboardType:
                isPassword
                    ? TextInputType.visiblePassword
                    : TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
            style: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
