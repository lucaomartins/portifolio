import 'package:flutter/material.dart';

import 'home_base.dart';

class HomeTablet extends BaseHomePage {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  double? getPositionedTop(width, height) {
    return null;
  }

  @override
  double? getPositionedBottom(width, height) {
    return width < 740 ? height * 0.1 : height * 0.15;
  }

  @override
  double? getPositionedRight(width, height) {
    return width < 740 ? -width * 0.2 : -width * 0.1;
  }

  @override
  EdgeInsetsGeometry? getHeaderMargin(width, height) {
    return EdgeInsets.fromLTRB(
      width * 0.1,
      width < 740 ? height * 0.15 : height * 0.2,
      0,
      0,
    );
  }

  @override
  double? getImageHeight(width, height) {
    return height * 0.75;
  }

  @override
  double? getWelcomeFontSize(width, height) {
    return height * 0.03;
  }

  @override
  double? getNameFontSize(width, height) {
    return height * 0.07;
  }
}
