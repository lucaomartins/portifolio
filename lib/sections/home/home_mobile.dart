import 'package:flutter/material.dart';
import 'home_base.dart';

class HomeMobile extends BaseHomePage {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  String get welcomeText => "HEY THERE! ";

  @override
  double? getPositionedTop(width, height) {
    return null;
  }

  @override
  double? getPositionedBottom(width, height) {
    return 0.0;
  }

  @override
  double? getPositionedRight(width, height) {
    return -width * 0.25;
  }

  @override
  EdgeInsetsGeometry? getHeaderMargin(width, height) {
    return EdgeInsets.fromLTRB(width * 0.07, height * 0.12, 0, 0);
  }

  @override
  double? getImageHeight(width, height) {
    return height * 0.65;
  }

  @override
  double? getWelcomeFontSize(width, height) {
    return height * 0.025;
  }
}
