import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_string.dart';
import '../constants/colors.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
   bool showAboutMe = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      height: screenHeight/2,
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar img
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg.withOpacity(0.6),
                CustomColor.scaffoldBg.withOpacity(0.6),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child:          Container(
            width: screenWidth / 2,
            height: screenWidth / 2,
         
            decoration: const BoxDecoration(
                 color: Colors.transparent,
                 image: DecorationImage(
                   image: AssetImage("assets/avatar.png"),
                   fit: BoxFit.cover,
                 ),
                 shape: BoxShape.rectangle,
                 borderRadius: BorderRadius.all(
                   Radius.circular(19.0),
                 ),

            ),
           
          ),
          ),
          const SizedBox(height: 30),
          // intro message
          const Text("Hello,\nI'm Tapendra Bista\nFlutter Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 15),
          // contact btn
          SizedBox(
            width: 190.0,
            child: ElevatedButton(
              onPressed: () {
                  if (showAboutMe == false) {
                          setState(() {
                            showAboutMe = true;
                          });
                        } else {
                          setState(() {
                            showAboutMe = false;
                          });
                        }
              },
                    child:  Text(showAboutMe==true?"Close":"About Me",style: const TextStyle(color: Colors.white),),
              
            ),
          )
            ,const SizedBox(height:13),
            showAboutMe==true?  const Text(AppStrings.aboutMe):const SizedBox()
           ,const SizedBox(height:13),
        ],
      ),
    );
  }
}
