import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/widgets/project_card.dart';

import '../constants/colors.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int _currentIndex = 1;
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
          ProjectCardWidget(
            constraints: widget.constraints,
            project: workProjectUtils[_currentIndex - 1],
          ),
          const SizedBox(height: 15),
          // Work projects cards
          NumberPagination(
            firstPageIcon: const Icon(
              Icons.first_page,
              color: CustomColor.whitePrimary,
            ),
            previousPageIcon: const Icon(
              Icons.keyboard_arrow_left,
              color: CustomColor.whitePrimary,
            ),
            nextPageIcon: const Icon(
              Icons.keyboard_arrow_right,
              color: CustomColor.whitePrimary,
            ),
            lastPageIcon: const Icon(
              Icons.last_page,
              color: CustomColor.whitePrimary,
            ),
            selectedButtonColor: CustomColor.yellowPrimary,
            unSelectedButtonColor: CustomColor.scaffoldBg,
            selectedNumberColor: CustomColor.whitePrimary,
            unSelectedNumberColor: CustomColor.whitePrimary,
            controlButtonColor: CustomColor.yellowPrimary,
            totalPages: workProjectUtils.length,
            currentPage: _currentIndex,
            visiblePagesCount: 3,
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
