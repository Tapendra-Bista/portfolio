// No need for: // ignore_for_file: avoid_web_libraries_in_flutter

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';

class ProjectCardWidget extends StatefulWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
    required this.constraints,
  });
// galaxy s21
  final ProjectUtils project;
  final BoxConstraints constraints;
  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool showInformation = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (widget.constraints.maxWidth >= kMedDesktopWidth)
            ? Container(
                clipBehavior: Clip.antiAlias,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: CustomColor.bgLight2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 570,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  widget.project.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: CustomColor.whitePrimary,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 20, 12, 0),
                                child: Text(
                                  widget.project.subtitle,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 13,
                                    color: CustomColor.whitePrimary,
                                  ),
                                  maxLines: 24,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: CustomColor.bgLight1,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Available on:",
                                  style: TextStyle(
                                    color: CustomColor.yellowSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 10),
                                IconButton(
                                  onPressed: () async {
                                    if (widget.project.projectLink != null) {
                                      await _urlLaunchar(
                                          url: widget.project.projectLink!);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  CustomColor.scaffoldBg,
                                              content: Center(
                                                child: Text(
                                                  "Something went wrong !",
                                                  style: TextStyle(
                                                      color: CustomColor
                                                          .whitePrimary),
                                                ),
                                              )));
                                    }
                                  },
                                  icon: Image.asset(
                                    "assets/github.png",
                                    width: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // // project image
                  ],
                ),
              )
            : SizedBox.shrink(),
        Container(
          clipBehavior: Clip.antiAlias,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: (widget.constraints.maxWidth >= kMedDesktopWidth)
                    ? Radius.zero
                    : Radius.circular(10),
                topLeft: (widget.constraints.maxWidth >= kMedDesktopWidth)
                    ? Radius.zero
                    : Radius.circular(10)),
            color: CustomColor.bgLight2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              (widget.constraints.maxWidth >= kMedDesktopWidth)
                  ? SizedBox.square()
                  : Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () => setState(() {
                                showInformation = !showInformation;
                              }),
                          icon: Icon(showInformation
                              ? Icons.close_outlined
                              : Icons.info_outline)),
                    ),
              if (showInformation)
                SizedBox(
                  height: 570,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.project.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: CustomColor.whitePrimary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
                            child: Text(
                              widget.project.subtitle,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 13,
                                color: CustomColor.whiteSecondary,
                              ),
                              maxLines: 24,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: CustomColor.bgLight1,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Available on:",
                              style: TextStyle(
                                color: CustomColor.yellowSecondary,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              onPressed: () async {
                                if (widget.project.projectLink != null) {
                                  await _urlLaunchar(
                                      url: widget.project.projectLink!);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor:
                                              CustomColor.scaffoldBg,
                                          content: Center(
                                            child: Text(
                                              "Something went wrong !",
                                              style: TextStyle(
                                                  color:
                                                      CustomColor.whitePrimary),
                                            ),
                                          )));
                                }
                              },
                              icon: Image.asset(
                                "assets/github.png",
                                width: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              if (!showInformation)
                CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true, // Don't enlarge the center image
                    // Each item takes 50% of the width
                    height: 570, autoPlay: true,
                  ),
                  items: widget.project.images.map((i) {
                    return Image.asset(
                      i,
                      height: double.maxFinite,
                      width: double.maxFinite,
                    );
                  }).toList(),
                ),

              // // project image
            ],
          ),
        )
      ],
    );
  }

  Future<void> _urlLaunchar({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception("Could not launch $url");
    }
  }
}
