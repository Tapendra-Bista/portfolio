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
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          const Text(
            "Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
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

          // send button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      messageController.text.isNotEmpty) {
                    nameController.clear();
                    emailController.clear();
                    messageController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: CustomColor.scaffoldBg,
                        content: Text(
                          AppStrings.thankYou,
                          style: TextStyle(color: CustomColor.whitePrimary),
                        )));
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
                child: const Text(
                  "Get in touch",
                  style: TextStyle(color: Colors.white),
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
}
