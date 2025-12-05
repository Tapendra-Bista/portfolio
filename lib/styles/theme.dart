import 'package:flutter/material.dart';

import '../constants/colors.dart';

ThemeData kCustomTheme = ThemeData.dark().copyWith(
  iconTheme: const IconThemeData(
    color: CustomColor.whitePrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColor.accentBlue,
      foregroundColor: Colors.white,
      elevation: 8,
      shadowColor: CustomColor.accentBlue.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      fixedSize: const Size.fromHeight(50),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 0.5,
      ),
    ),
  ),
);
