import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Colors.deepPurple;
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const Color primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class ThemesClass {
  static final light = ThemeData(
    primaryColor: yellowClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20,
    color: Get.isDarkMode ? Colors.grey[500] : Colors.grey,
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 30,
    //color: Get.isDarkMode ? Colors.black : Colors.white,
    fontWeight: FontWeight.bold,
  ));
}
