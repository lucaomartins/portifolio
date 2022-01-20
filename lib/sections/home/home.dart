import 'package:flutter/material.dart';
import 'package:portfolio/sections/home/home_desktop.dart';
import 'package:portfolio/sections/home/home_mobile.dart';
import 'package:portfolio/widgets/section_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_tablet.dart';

class HomePage extends StatelessWidget implements SectionWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  String get name => "HOME";
  @override
  IconData get icon => Icons.home;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const HomeMobile(),
      tablet: const HomeTablet(),
      desktop: const HomeDesktop(),
    );
  }
}
