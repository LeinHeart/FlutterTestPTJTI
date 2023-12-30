import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle roboto({
    double fontSize = 24,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
