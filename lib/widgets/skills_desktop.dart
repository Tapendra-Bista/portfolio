import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart';

class SkillsDesktop extends StatefulWidget {
  const SkillsDesktop({super.key});

  @override
  State<SkillsDesktop> createState() => _SkillsDesktopState();
}

class _SkillsDesktopState extends State<SkillsDesktop> {
  int _hoveredPlatformIndex = -1;
  int _hoveredSkillIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // platforms
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                MouseRegion(
                  onEnter: (_) => setState(() => _hoveredPlatformIndex = i),
                  onExit: (_) => setState(() => _hoveredPlatformIndex = -1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 200,
                    transform: _hoveredPlatformIndex == i
                        ? Matrix4.diagonal3Values(1.05, 1.05, 1.0)
                        : Matrix4.identity(),
                    decoration: BoxDecoration(
                      gradient: _hoveredPlatformIndex == i
                          ? LinearGradient(
                              colors: [
                                CustomColor.accentBlue.withValues(alpha: 0.3),
                                CustomColor.accentPurple.withValues(alpha: 0.3),
                              ],
                            )
                          : null,
                      color: _hoveredPlatformIndex == i
                          ? null
                          : CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: _hoveredPlatformIndex == i
                          ? [
                              BoxShadow(
                                color: CustomColor.accentBlue
                                    .withValues(alpha: 0.3),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ]
                          : [],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      leading: Image.asset(
                        platformItems[i]["img"],
                        width: 26.0,
                      ),
                      title: Text(
                        platformItems[i]["title"],
                        style: TextStyle(
                          fontWeight: _hoveredPlatformIndex == i
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(width: 50),

        // skills
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  MouseRegion(
                    onEnter: (_) => setState(() => _hoveredSkillIndex = i),
                    onExit: (_) => setState(() => _hoveredSkillIndex = -1),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: _hoveredSkillIndex == i
                          ? Matrix4.diagonal3Values(1.1, 1.1, 1.0)
                          : Matrix4.identity(),
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        backgroundColor: _hoveredSkillIndex == i
                            ? CustomColor.accentBlue.withValues(alpha: 0.4)
                            : CustomColor.bgLight2,
                        side: _hoveredSkillIndex == i
                            ? BorderSide(
                                color: CustomColor.accentBlue,
                                width: 2,
                              )
                            : BorderSide.none,
                        label: Text(
                          skillItems[i]["title"],
                          style: TextStyle(
                            fontWeight: _hoveredSkillIndex == i
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        avatar: Image.asset(skillItems[i]["img"]),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
