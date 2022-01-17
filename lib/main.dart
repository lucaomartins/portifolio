import 'package:flutter/material.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/providers/theme_stylers.dart';
import 'package:portfolio/sections/main_section.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeProvider _themeProvider = ThemeProvider();

  void getCurrentAppTheme() async {
    _themeProvider.lightTheme = await _themeProvider.darkThemePref.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: developerName,
            theme: ThemeStyles.themeData(themeProvider.lightTheme, context),
            initialRoute: "/",
            routes: {
              "/": (context) => const MainPage(),
              "/workTogether": (context) => Container(),
              "/details": (context) => Container()
            },
          );
        },
      ),
    );
  }
}
