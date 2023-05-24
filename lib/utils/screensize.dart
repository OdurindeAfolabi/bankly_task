import 'package:flutter/material.dart';
class Responsive{
  static screenWidth(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }
  static screenHeight(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }

  static widthSizer(double value, BuildContext context, {figmaWidth = 375}) {
    // 412 is the default design screen width on figma
    return MediaQuery.of(context).size.width *
        (value / figmaWidth); // width size on figma
  }

  static heightSizer(double value, BuildContext context, {figmaHeight = 812}) {
    // 870 is the default design screen height on figma
    return MediaQuery.of(context).size.height *
        (value / figmaHeight); // height size on figma
  }
}