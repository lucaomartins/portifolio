import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants.dart';

class ThemeStyles {
  static ThemeData themeData(bool isLightTheme, BuildContext buildContext) {
    return isLightTheme ? _lightTheme(buildContext) : _darkTheme(buildContext);
  }

  static ThemeData _darkTheme(buildContext) => ThemeData(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        highlightColor: highlightColor,
        canvasColor: Colors.white,
        textTheme: GoogleFonts.nunitoTextTheme().apply(
              bodyColor: foregroundColor,
              displayColor: foregroundColor,
            ).copyWith(
          headline1: GoogleFonts.exo2(
            color: foregroundColor,
            fontWeight: FontWeight.w600
          )
        ),
        colorScheme: Theme.of(buildContext).colorScheme.copyWith(
              secondary: secondaryColor,
              brightness: Brightness.light,
            ),
      );

  static ThemeData _lightTheme(buildContext) => ThemeData(
        primaryColor: primaryLightColor,
        backgroundColor: backgroundLightColor,
        highlightColor: Colors.black,
        canvasColor: Colors.white,
        textTheme: Theme.of(buildContext).textTheme.apply(
              bodyColor: foregroundLightColor,
              displayColor: foregroundLightColor,
            ),
        colorScheme: Theme.of(buildContext).colorScheme.copyWith(
              secondary: Colors.black,
              brightness: Brightness.light,
            ),
      );
}
