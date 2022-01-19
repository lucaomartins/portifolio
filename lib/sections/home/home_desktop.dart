import 'package:flutter/material.dart';
import 'home_base.dart';

class HomeDesktop extends BaseHomePage {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  double? getPositionedTop(width, height) {
    return width < 1200 ? height * 0.15 : height * 0.1;
  }

  @override
  double? getPositionedBottom(width, height) {
    return null;
  }

  @override
  double? getPositionedRight(width, height) {
    return width * 0.01;
  }

  @override
  double? getImageHeight(width, height) {
    return width < 1200 ? height * 0.8 : height * 0.85;
  }

  @override
  EdgeInsetsGeometry? getHeaderMargin(width, height) {
    return EdgeInsets.fromLTRB(width * 0.1, height * 0.2, width * 0.1, 0);
  }

  @override
  double? getWelcomeFontSize(width, height) {
    return height * 0.03;
  }
}
