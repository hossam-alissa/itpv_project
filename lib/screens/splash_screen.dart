import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: SvgPicture.asset("assets/images_svg/splash_screen_background.svg",fit: BoxFit.cover,),
          ),
          Center(
            child: SvgPicture.asset("assets/images_svg/app_logo.svg",height: 200,width: 200,),
          )
        ],
      ),
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(Duration(seconds: 1));
  }
}
