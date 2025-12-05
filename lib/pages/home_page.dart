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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());
  late AnimationController _skillsAnimationController;
  late AnimationController _projectsAnimationController;
  late Animation<double> _skillsFadeAnimation;
  late Animation<Offset> _skillsSlideAnimation;
  late Animation<double> _projectsFadeAnimation;
  late Animation<Offset> _projectsSlideAnimation;
  bool _skillsAnimated = false;
  bool _projectsAnimated = false;

  @override
  void initState() {
    super.initState();

    _skillsAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _projectsAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _skillsFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _skillsAnimationController, curve: Curves.easeOut),
    );

    _skillsSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _skillsAnimationController, curve: Curves.easeOutCubic));

    _projectsFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _projectsAnimationController, curve: Curves.easeOut),
    );

    _projectsSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _projectsAnimationController, curve: Curves.easeOutCubic));

    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Animate skills section when it comes into view
    if (!_skillsAnimated && _isWidgetVisible(navbarKeys[1])) {
      _skillsAnimationController.forward();
      _skillsAnimated = true;
    }

    // Animate projects section when it comes into view
    if (!_projectsAnimated && _isWidgetVisible(navbarKeys[3])) {
      _projectsAnimationController.forward();
      _projectsAnimated = true;
    }
  }

  bool _isWidgetVisible(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return false;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    return position.dy < screenHeight * 0.75;
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    _skillsAnimationController.dispose();
    _projectsAnimationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

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

              // SKILLS with scroll animation
              FadeTransition(
                opacity: _skillsFadeAnimation,
                child: SlideTransition(
                  position: _skillsSlideAnimation,
                  child: Container(
                    key: navbarKeys[1],
                    width: screenWidth,
                    padding: EdgeInsets.fromLTRB(
                      constraints.maxWidth < 600 ? 15 : 25,
                      20,
                      constraints.maxWidth < 600 ? 15 : 25,
                      60,
                    ),
                    color: CustomColor.bgLight1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // title with gradient
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: CustomColor.cardGradient,
                          ).createShader(bounds),
                          child: Text(
                            "What I can do",
                            style: TextStyle(
                              fontSize: constraints.maxWidth < 600 ? 28 : 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
                ),
              ),
              const SizedBox(height: 30),

              // PROJECTS with scroll animation
              FadeTransition(
                opacity: _projectsFadeAnimation,
                child: SlideTransition(
                  position: _projectsSlideAnimation,
                  child: ProjectsSection(
                    constraints: constraints,
                    key: navbarKeys[3],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              // education
              Container(
                key: navbarKeys[2],
                width: screenWidth,
                padding: EdgeInsets.fromLTRB(
                  constraints.maxWidth < 600 ? 15 : 25,
                  20,
                  constraints.maxWidth < 600 ? 15 : 25,
                  60,
                ),
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
