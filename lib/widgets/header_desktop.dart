import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/widgets/site_logo.dart';

import '../constants/colors.dart';
import '../constants/nav_items.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      width: double.maxFinite,
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
            blurRadius: 20,
            spreadRadius: 2,
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
                  onTap: () {},
                ),
              ),
              const Spacer(),
              for (int i = 0; i < navTitles.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: MouseRegion(
                    onEnter: (_) => setState(() => _hoveredIndex = i),
                    onExit: (_) => setState(() => _hoveredIndex = -1),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: _hoveredIndex == i
                            ? LinearGradient(
                                colors: CustomColor.primaryGradient,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          widget.onNavMenuTap(i);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          navTitles[i],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: _hoveredIndex == i
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
