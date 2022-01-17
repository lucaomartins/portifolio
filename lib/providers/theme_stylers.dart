import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class ThemeStyles {
  static ThemeData themeData(bool isLightTheme, BuildContext buildContext) {
    return isLightTheme ? _lightTheme(buildContext) : _darkTheme(buildContext);
  }

  static ThemeData _darkTheme(buildContext) =>
      ThemeData(
        primaryColor: primaryColor,
        highlightColor: highlightColor,
        canvasColor: Colors.white,
        colorScheme: Theme
            .of(buildContext)
            .colorScheme
            .copyWith(
            secondary: secondaryColor, brightness: Brightness.light),
      );

  static ThemeData _lightTheme(buildContext) =>
      ThemeData(
        primaryColor: primaryLightColor,
        highlightColor: Colors.black,
        canvasColor: Colors.white,
        colorScheme: Theme
            .of(buildContext)
            .colorScheme
            .copyWith(
            secondary: Colors.black, brightness: Brightness.light),
      );
}
