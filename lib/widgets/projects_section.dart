import 'package:flutter/material.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/colors.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Column(
        children: [
          // Work projects title
          const Text(
            "Work projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 20),

          // Work projects cards
          SizedBox(
            height:
                (widget.constraints.maxWidth >= kMedDesktopWidth) ? 570 : 610,
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller:
                  _pageController, // Crucial: Link controller to PageView
              itemCount: workProjectUtils.length,
              itemBuilder: (context, index) {
                return ProjectCardWidget(
                  constraints: widget.constraints,
                  project: workProjectUtils[index],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _pageController, // Use the same controller here
            count: workProjectUtils.length,
            effect: ExpandingDotsEffect(),
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
        ],
      ),
    );
  }
}
