import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_string.dart';

import '../constants/colors.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile>
    with SingleTickerProviderStateMixin {
  bool showAboutMe = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth > 400 ? 20.0 : 15.0,
        vertical: 30.0,
      ),
      constraints: BoxConstraints(
        minHeight: screenWidth < 400 ? 500.0 : 560.0,
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // avatar img with gradient border
            Container(
              width: screenWidth < 400 ? screenWidth * 0.55 : screenWidth / 1.8,
              height:
                  screenWidth < 400 ? screenWidth * 0.55 : screenWidth / 1.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: CustomColor.cardGradient,
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.accentCyan.withValues(alpha: 0.4),
                    blurRadius: 30,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(21),
                    image: const DecorationImage(
                      image: AssetImage("assets/avatar.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // intro message with gradient
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: CustomColor.primaryGradient,
              ).createShader(bounds),
              child: Text(
                "Hello,\nI'm Tapendra Bista\nFlutter Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth < 400 ? 22 : 28,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Building beautiful mobile experiences",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth < 400 ? 13 : 14,
                  color: CustomColor.whiteSecondary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // contact btn with gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: CustomColor.primaryGradient,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.accentBlue.withValues(alpha: 0.4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showAboutMe = !showAboutMe;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size(180, 50),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      showAboutMe ? "Close" : "About Me",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      showAboutMe ? Icons.close : Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // About me section
            if (showAboutMe)
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomColor.bgLight1.withValues(alpha: 0.8),
                        CustomColor.bgLight2.withValues(alpha: 0.6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: CustomColor.accentBlue.withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      AppStrings.aboutMe,
                      style: const TextStyle(
                        color: CustomColor.whitePrimary,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
