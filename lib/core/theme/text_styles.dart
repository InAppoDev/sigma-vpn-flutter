import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

double screenWidthRatio(double width) {
  return Get.width * width / 360;
}

double screenHeightRatio(double height) {
  return Get.height * height / 640;
}

final TextStyle wRegularS22primary = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: primaryColor,
        fontSize: screenHeightRatio(22),
        fontWeight: FontWeight.normal));

final TextStyle wBoldS22White = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: white,
        fontSize: screenHeightRatio(22),
        fontWeight: FontWeight.bold));

final TextStyle wRegularS14White = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: white,
        fontSize: screenHeightRatio(14),
        fontWeight: FontWeight.normal));
final TextStyle wRegularS24White = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: white,
        fontSize: screenHeightRatio(24),
        fontWeight: FontWeight.normal));
final TextStyle wRegularS15White = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: white,
        fontSize: screenHeightRatio(15),
        fontWeight: FontWeight.normal));
final TextStyle wRegularS16White = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: white,
        fontSize: screenHeightRatio(16),
        fontWeight: FontWeight.normal));
final TextStyle wRegularS17White = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: white,
        fontSize: screenHeightRatio(17),
        fontWeight: FontWeight.normal));
final TextStyle wRegularS17Primary = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: primaryColor,
        fontSize: screenHeightRatio(32),
        fontWeight: FontWeight.normal));

final TextStyle wBoldS16Primary = GoogleFonts.roboto(
    textStyle: TextStyle(
        color: primaryColor,
        fontSize: screenHeightRatio(16),
        fontWeight: FontWeight.bold));
final TextStyle wMediumS13Black = GoogleFonts.roboto(
  textStyle: TextStyle(
      color: CupertinoColors.black,
      fontSize: screenHeightRatio(13),
      fontWeight: FontWeight.w500),
);

final TextStyle wMediumS16White = GoogleFonts.roboto(
  textStyle: TextStyle(
      color: CupertinoColors.white,
      fontSize: screenHeightRatio(16),
      fontWeight: FontWeight.w500),
);
