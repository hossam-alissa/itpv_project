import 'package:flutter/material.dart';

//App Colors
int themeNumber = 0;
const List<Color> mainColor = [
  Color.fromRGBO(51, 25, 81, 1),
  Color.fromRGBO(30, 163, 165, 1.0)
];
const List<Color> secondColor = [
  Color.fromRGBO(143, 59, 186, 1),
  Color.fromRGBO(186, 40, 44, 1.0)
];
const Color whiteColor = Colors.white;

//Font size for App
double spase = 1;
double fontSize = 1;
double fontSizeTitle = 25;

//Context Provider for App
BuildContext? contextProvider;

//Size Screen
double? widthSizeScreen;
double? heightSizeScreen;

TextStyle styleListView = TextStyle(
    color: Colors.white, fontWeight: FontWeight.w400, fontSize: fontSize.toDouble());

//Customize font size for screen size
void appSetting(double screenSize) {
  if (screenSize < 800) {
    spase = 1;
    fontSize = 16.0;
  } else if (screenSize >= 800 && screenSize < 1200) {
    spase = 3;
    fontSize = 24.0;
  } else {
    //screenSize >= 1200
    spase = 5;
    fontSize = 56.0;
  }
}
