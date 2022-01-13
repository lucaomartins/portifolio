
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class ThemeStyles {
  static ThemeData themeData(bool lightTheme, BuildContext buildContext) {
    return lightTheme
        ?
    // Light Theme
    ThemeData(
      primaryColor: primaryLightColor,
      highlightColor: Colors.black,
      canvasColor: Colors.white,
      colorScheme: Theme.of(buildContext).colorScheme.copyWith(
          secondary: Colors.black,
          brightness: Brightness.light
      ),
    )
        : ThemeData(
      primaryColorLight: primaryLightColor,
      primaryColorDark: primaryColor,
      primaryColor: primaryColor,
      highlightColor: highlightColor,
      canvasColor: Colors.white,
      colorScheme: Theme.of(buildContext).colorScheme.copyWith(
          secondary: secondaryColor,
          brightness: Brightness.light
      ),
    );
  }
}