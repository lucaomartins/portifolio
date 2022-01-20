import 'package:flutter/widgets.dart';

abstract class SectionWidget extends Widget {
  const SectionWidget({Key? key}) : super(key: key);

  String get name;
  IconData get icon;
}