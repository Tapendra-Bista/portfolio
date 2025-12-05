import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        children: [
          // platforms
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomColor.bgLight2,
                    CustomColor.bgLight1,
                  ],
                ),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.accentBlue.withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                leading: Image.asset(
                  platformItems[i]["img"],
                  width: 26.0,
                ),
                title: Text(
                  platformItems[i]["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 50),

          // skills
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Chip(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  backgroundColor: CustomColor.bgLight2,
                  side: BorderSide(
                    color: CustomColor.accentBlue.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  label: Text(
                    skillItems[i]["title"],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  avatar: Image.asset(skillItems[i]["img"]),
                ),
            ],
          )
        ],
      ),
    );
  }
}
