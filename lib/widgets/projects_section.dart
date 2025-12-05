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
      padding: EdgeInsets.fromLTRB(
        screenWidth < 600 ? 15 : 25,
        40,
        screenWidth < 600 ? 15 : 25,
        0,
      ),
      child: Column(
        children: [
          // Work projects title with gradient
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: CustomColor.primaryGradient,
            ).createShader(bounds),
            child: Text(
              "Work projects",
              style: TextStyle(
                fontSize: screenWidth < 600 ? 28 : 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Explore my latest work",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth < 600 ? 14 : 16,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const SizedBox(height: 30),

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
            effect: ExpandingDotsEffect(
              activeDotColor: CustomColor.accentBlue,
              dotColor: CustomColor.whiteSecondary.withValues(alpha: 0.3),
              dotHeight: 12,
              dotWidth: 12,
              expansionFactor: 3,
              spacing: 8,
            ),
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
