import 'package:flutter/material.dart';

import 'theme_preference.dart';

class ThemeProvider extends ChangeNotifier {
  ThemePreference darkThemePref = ThemePreference();
  final ScrollController _scrollController = ScrollController();

  get scroll => _scrollController;

  void setScroll(int i) {
    _scrollController.animateTo(
      i == 0 ? 100 : 0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  // App Theme
  bool _lightTheme = false;
  bool get lightTheme => _lightTheme;

  set lightTheme(bool value) {
    _lightTheme = value;
    darkThemePref.setDarkTheme(value);

    notifyListeners();
  }
}