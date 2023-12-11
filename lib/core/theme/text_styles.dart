import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

double screenWidthRatio(double width, BuildContext context) {
  return MediaQuery.of(context).size.width * width / 360;
}

double screenHeightRatio(double height, BuildContext context) {
  return MediaQuery.of(context).size.height * height / 640;
}

final TextStyle wRegularS22primary = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: primaryColor, fontSize: 22, fontWeight: FontWeight.normal));

final TextStyle wBoldS22White = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: white, fontSize: 22, fontWeight: FontWeight.bold));

final TextStyle wRegularS14White = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: white, fontSize: 14, fontWeight: FontWeight.normal));
final TextStyle wRegularS24White = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: white, fontSize: 24, fontWeight: FontWeight.normal));
final TextStyle wRegularS15White = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: white, fontSize: 15, fontWeight: FontWeight.normal));
final TextStyle wRegularS16White = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: white, fontSize: 16, fontWeight: FontWeight.normal));
final TextStyle wRegularS17White = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: white, fontSize: 17, fontWeight: FontWeight.normal));
final TextStyle wRegularS17Primary = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: primaryColor, fontSize: 32, fontWeight: FontWeight.normal));

final TextStyle wBoldS16Primary = GoogleFonts.roboto(
    textStyle: const TextStyle(
        color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold));
final TextStyle wMediumS13Black = GoogleFonts.roboto(
  textStyle: const TextStyle(
      color: CupertinoColors.black, fontSize: 13, fontWeight: FontWeight.w500),
);

final TextStyle wMediumS16White = GoogleFonts.roboto(
  textStyle: const TextStyle(
      color: CupertinoColors.white, fontSize: 16, fontWeight: FontWeight.w500),
);
