import 'package:flutter/material.dart';

class HelperFunctions{
  static Size screenSize(BuildContext context){
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

}