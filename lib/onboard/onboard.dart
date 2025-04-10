import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krl/authscreens/login.dart';
import 'package:krl/utils/colors.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    'assets/applogo.png',
    'assets/applogo.png',
    'assets/applogo.png',
  ];

  final List<String> _texts = [
    "Streamline Your Business Workflow\nwith Real-Time Management.",
    "Monitor Orders, Inventory, and Dispatch\nAll in One Place.",
    "Start Managing Smarter\nwith Our ERM Platform Today.",
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _images[index],
                          height: screenHeight * 0.3,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: screenHeight * 0.1),
                        Text(
                          _texts[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 70),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _images.length,
                      (index) => _buildIndicator(index == _currentPage),
                    ),
                  ),
                  SizedBox(height: 30),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: _currentPage == _texts.length - 1 ? 1.0 : 0.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btntheamColor,
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: screenWidth * 0.3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: isActive ? 24 : 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.btntheamColor : Colors.black12,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
