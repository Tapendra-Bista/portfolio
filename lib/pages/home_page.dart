import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/skills_desktop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';

import '../constants/size.dart';

import '../widgets/drawer_mobile.dart';
import '../widgets/footer.dart';
import '../widgets/header_desktop.dart';
import '../widgets/header_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarKeys.first),

              // MAIN
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(onNavMenuTap: (int navIndex) {
                  scrollToSection(navIndex);
                })
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              // SKILLS
              Container(
                key: navbarKeys[1],
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // title
                    const Text(
                      "What I can do",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 50),

                    // platforms and skills
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // education
              Container(
                key: navbarKeys[2],
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stepper(
                        currentStep: _index,
                        onStepCancel: () {
                          if (_index > 0) {
                            setState(() {
                              _index -= 1;
                            });
                          }
                        },
                        onStepContinue: () {
                          if (_index < 2) {
                            // Since you have 3 steps (0, 1, 2)
                            setState(() {
                              _index += 1;
                            });
                          }
                        },
                        onStepTapped: (int index) {
                          setState(() {
                            _index = index;
                          });
                        },
                        steps: [
                          Step(
                              state: StepState.complete,
                              title: const Text(
                                "BACHELOR",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.whitePrimary,
                                ),
                              ),
                              content: RichText(
                                text: const TextSpan(
                                    text:
                                        "Hi, I am currently in my seventh semester of studying for a",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: CustomColor.whitePrimary,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            " BSc in Computer Science and Information Technology (CSIT)",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.yellowPrimary,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " at ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: CustomColor.whitePrimary,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " Amrit Campus",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.yellowPrimary,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ", which is located in the heart of Kathmandu.",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: CustomColor.whitePrimary,
                                        ),
                                      ),
                                    ]),
                              )),
                          Step(
                              state: StepState.complete,
                              title: const Text(
                                "NEB +2",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.whitePrimary,
                                ),
                              ),
                              content: RichText(
                                text: const TextSpan(
                                    text: "I studied NEB +2 at ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: CustomColor.whitePrimary,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " Texas College",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.yellowPrimary,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ", which is located in Mitra Park, in 2021.",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: CustomColor.whitePrimary,
                                        ),
                                      ),
                                    ]),
                              )),
                          Step(
                              state: StepState.complete,
                              title: const Text(
                                "SEE",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.whitePrimary,
                                ),
                              ),
                              content: RichText(
                                text: const TextSpan(
                                    text: "I studied SEE at ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: CustomColor.whitePrimary,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " Sirjana English School",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.yellowPrimary,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ", which is located in Gokarneshwor, in 2019.",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: CustomColor.whitePrimary,
                                        ),
                                      ),
                                    ]),
                              ))
                        ])
                  ],
                ),
              ),

              const SizedBox(height: 30),
              // PROJECTS
              ProjectsSection(
                key: navbarKeys[3],
              ),

              const SizedBox(height: 30),

              // CONTACT
              ContactSection(
                key: navbarKeys[4],
              ),
              const SizedBox(height: 30),

              // FOOTER
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  int _index = 0;
}
