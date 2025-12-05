import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColor.scaffoldBg,
            CustomColor.bgLight1,
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: CustomColor.accentPink,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                "Made by Tapendra Bista with Flutter",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whiteSecondary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "© 2025 All rights reserved",
            style: TextStyle(
              color: CustomColor.whiteSecondary.withValues(alpha: 0.6),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
