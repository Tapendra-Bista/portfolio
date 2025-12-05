import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_string.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/sns_links.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.fromLTRB(
        screenWidth < 600 ? 15 : 25,
        40,
        screenWidth < 600 ? 15 : 25,
        60,
      ),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title with gradient
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: CustomColor.accentGradient,
            ).createShader(bounds),
            child: Text(
              "Get in touch",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth < 600 ? 28 : 36,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Let's build something amazing together",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth < 600 ? 14 : 16,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const SizedBox(height: 50),

          // name + email
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop(
                      name: nameController, email: emailController);
                }
                return buildNameEmailFieldMobile(
                    name: nameController, email: emailController);
              },
            ),
          ),
          const SizedBox(height: 15),

          // message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              hintText: "Your message",
              controller: messageController,
              maxLines: 7,
            ),
          ),
          const SizedBox(height: 20),

          // send button with gradient
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: CustomColor.accentGradient,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.accentPink.withValues(alpha: 0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        messageController.text.isNotEmpty) {
                      // Email validation
                      if (!_isValidEmail(emailController.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: const Text(
                            "Please enter a valid email address",
                            style: TextStyle(color: Colors.white),
                          ),
                        ));
                        return;
                      }

                      // Send email
                      final result = await _sendEmail(
                        nameController.text,
                        emailController.text,
                        messageController.text,
                      );

                      if (result) {
                        nameController.clear();
                        emailController.clear();
                        messageController.clear();

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: CustomColor.accentBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            content: const Text(
                              AppStrings.thankYou,
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            content: const Text(
                              "Failed to open email app. Please try again.",
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: CustomColor.scaffoldBg,
                          content: Center(
                            child: Text(
                              AppStrings.validate,
                              style: TextStyle(color: CustomColor.whitePrimary),
                            ),
                          )));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    "Send Message",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // divider
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(height: 15),

          // social icons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              socialIcon("assets/github.png", SnsLinks.github),
              socialIcon("assets/linkedin.png", SnsLinks.linkedIn),
              socialIcon("assets/facebook.png", SnsLinks.facebook),
              socialIcon("assets/instagram.png", SnsLinks.instagram),
              socialIcon("assets/freelancer.png", SnsLinks.freelancer),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop(
      {required TextEditingController name,
      required TextEditingController email}) {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your name",
            controller: name,
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          child: CustomTextField(
            controller: email,
            hintText: "Your email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile(
      {required TextEditingController name,
      required TextEditingController email}) {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            controller: name,
            hintText: "Your name",
          ),
        ),
        const SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            hintText: "Your email",
            controller: email,
          ),
        ),
      ],
    );
  }

  Widget socialIcon(String assetPath, String url) {
    return InkWell(
      onTap: () async {
        await _urlLaunchar(url: url);
      },
      child: Image.asset(
        assetPath,
        width: 28,
      ),
    );
  }

  Future<void> _urlLaunchar({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception("Could not launch $url");
    }
  }

  // Email validation
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  // Send email via mailto
  Future<bool> _sendEmail(String name, String email, String message) async {
    // Replace with your actual email
    const String myEmail = 'tapendrabista78@gmail.com';

    final String subject =
        Uri.encodeComponent('Portfolio Contact: Message from $name');
    final String body = Uri.encodeComponent('Name: $name\n'
        'Email: $email\n'
        'Message:\n$message');

    final Uri emailUri =
        Uri.parse('mailto:$myEmail?subject=$subject&body=$body');

    try {
      final bool launched = await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );
      return launched;
    } catch (e) {
      debugPrint('Error launching email: $e');
      return false;
    }
  }
}
