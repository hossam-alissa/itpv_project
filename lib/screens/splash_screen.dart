import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itpv_project/screens/screens.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
            children: [
              EasySplashScreen(
                durationInSeconds: 3,
                navigator: ShowMacAddressScreen(),
                logo: Image.asset(
                  "assets/images/app_icon.png",
                  height: 0.0,
                  width: 0.0,
                ),
                showLoader: false,
              ),
              Stack(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "assets/images_svg/splash_screen_background.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/images_svg/app_logo.svg",
                      height: 200,
                      width: 200,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}