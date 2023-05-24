import 'package:flutter/material.dart';

class AppColors {
  static Color white =  HexColor.fromHex("#FFFFFF");
  static Color black =  HexColor.fromHex("#000000");
  static Color black2 =  HexColor.fromHex("#191919");
  static Color banklyRed =  HexColor.fromHex("#E92022");
  static Color banklyBlue =  HexColor.fromHex("#296CF0");
  static Color banklyBlueLight =  HexColor.fromHex("#F4F7FF");
  static Color banklyGreen =  HexColor.fromHex("#3CC13B");
  static Color banklyGrey =  HexColor.fromHex("#E6E6E6");
  static Color grey2 =  HexColor.fromHex("#D3D3D3");
  static Color grey3 =  HexColor.fromHex("#828282");
  static Color dateGrey =  HexColor.fromHex("#9FA2AB");

}
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}