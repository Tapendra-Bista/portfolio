import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_string.dart';

import '../constants/colors.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
  bool showAboutMe = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
  
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
     
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // intro message
                  const Text(
                    "Hello,\nI'm Tapendra Bista\nFlutter Developer",
                    style: TextStyle(
                      fontSize: 25,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // contact btn
                  SizedBox(
                    width: 250.0,
                    
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
                ],
              ),
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
                width: screenWidth / 2.5,
                height: screenWidth / 2.5,
             
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
            ],
          ),
      const SizedBox(height:5),
        showAboutMe==true?  const Text(AppStrings.aboutMe):const SizedBox()
           ,const SizedBox(height:13),
        ],
      ),
    );
  }
}
