import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:input_flutter_animation/theme/colors.dart';

class AppTheme {
  const AppTheme._();

  static const colors = AppColors();

  static ThemeData define(BuildContext context) {
    Brightness themeBrightness = MediaQuery.of(context).platformBrightness;

    return ThemeData(
      brightness: themeBrightness,
      colorScheme: ColorScheme.fromSeed(
          brightness: themeBrightness,
          seedColor: const Color.fromARGB(255, 38, 101, 137),
          secondary: const Color.fromARGB(255, 80, 96, 110),
          tertiary: const Color.fromARGB(255, 100, 89, 123),
          error: const Color.fromARGB(255, 186, 26, 26)),
      textTheme: GoogleFonts.soraTextTheme(),
    );
  }
}
