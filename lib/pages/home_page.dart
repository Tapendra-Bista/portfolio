import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constant_string.dart';
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

              // PROJECTS
              ProjectsSection( constraints: constraints,
                key: navbarKeys[3],
              ),

              const SizedBox(height: 30),
              // education
              Container(
                key: navbarKeys[2],
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Padding(
                  padding: EdgeInsets.only(
                      left:
                          (constraints.maxWidth >= kMedDesktopWidth) ? 240 : 0),
                  child: RichText(
                      text: const TextSpan(
                          text: "Education",
                          style: TextStyle(
                            fontSize: 18,
                            color: CustomColor.whitePrimary,
                          ),
                          children: [
                        TextSpan(
                          text: AppStrings.education,
                          style: TextStyle(
                            fontSize: 14,
                            color: CustomColor.whitePrimary,
                          ),
                        ),
                      ])),
                ),
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
}
