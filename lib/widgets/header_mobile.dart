import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            CustomColor.bgLight1.withValues(alpha: 0.7),
            CustomColor.bgLight2.withValues(alpha: 0.5),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColor.accentBlue.withValues(alpha: 0.2),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SiteLogo(
                  onTap: onLogoTap,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: CustomColor.primaryGradient,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.menu, color: Colors.white),
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}
