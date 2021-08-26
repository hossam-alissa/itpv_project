import 'package:flutter/material.dart';

//App Colors
int themeNumber = 0;
const List<Color> mainColor =  [Color.fromRGBO(51, 25, 81, 1),Color.fromRGBO(143, 59, 186, 1)];
const List<Color> secondColor =  [Color.fromRGBO(143, 59, 186, 1),Color.fromRGBO(143, 59, 186, 1)];
const Color whiteColor = Colors.white;

//Font size for App
double fontSize = 20;
double fontSizeTitle = 25;

//Context Provider for App
BuildContext? contextProvider;

//Customize font size for screen size
void appSetting(double screenSize){
  if(screenSize > 800){

  }else if(screenSize >= 800 && screenSize <1200 ){

  }else{//screenSize >= 1200

  }
}