import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/animations/entrance_fader.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/widgets/arrow_on_top.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import '../utils.dart';
import 'nav_bar/nav_bar_logo.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ThemeProvider _themeProviders = ThemeProvider();
  bool isPressed = false;
  bool _isScrollingDown = false;
  ScrollController _scrollController = ScrollController();

  final List<String> _sectionsName = [
    "HOME",
    "ABOUT",
    "RESUME",
    "SERVICES",
    "PROJECTS",
    "CONTACT"
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.class_,
    Icons.phone,
  ];

  void _scroll(int i) {
    _scrollController.animateTo(
      i == 0
          ? 0.0
          : i == 1
              ? MediaQuery.of(context).size.height * 1.05
              : i == 2
                  ? MediaQuery.of(context).size.height * 1.98
                  : i == 3
                      ? MediaQuery.of(context).size.height * 2.9
                      : MediaQuery.of(context).size.height * 4,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget sectionWidget(int i) {
    // if (i == 0) {
    //   return HomePage();
    // } else if (i == 1) {
    //   return About();
    // } else if (i == 2) {
    //   return Services();
    // } else if (i == 3) {
    //   return Portfolio();
    // } else if (i == 4) {
    //   return Contact();
    // } else if (i == 5) {
    //   return Footer();
    // } else {
    //   return Container();
    // }
    return Container();
  }

  @override
  void initState() {
    _scrollController = _themeProviders.scroll;
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          setState(() {});
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _themeProv.lightTheme ? Colors.white : Colors.black,
      appBar: MediaQuery.of(context).size.width < 760
          ? AppBar(
              iconTheme: IconThemeData(
                  color: _themeProv.lightTheme ? Colors.black : Colors.white),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                NavBarLogo(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                )
              ],
            )
          : _appBarTabDesktop(_themeProv),
      drawer: MediaQuery.of(context).size.width < 760
          ? _appBarMobile(_themeProv)
          : null,
      body: Stack(
        children: [
          SectionsBody(
            scrollController: _scrollController,
            sectionsLength: _sectionsIcons.length,
            sectionWidget: sectionWidget,
          ),
          _isScrollingDown
              ? Positioned(
                  bottom: 90,
                  right: 0,
                  child: EntranceFader(
                      offset: const Offset(0, 20),
                      child: ArrowOnTop(
                        onPressed: () => _scroll(0),
                      )))
              : Container()
        ],
      ),
    );
  }

  Widget _appBarActions(
      String childText, int index, IconData icon, ThemeProvider themeProvider) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 60.0,
              child: MaterialButton(
                hoverColor: Theme.of(context).primaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: Theme.of(context).primaryColor.withAlpha(70),
              onPressed: () {
                _scroll(index);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(childText,
                    style: TextStyle(
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    )),
              ),
            ),
          );
  }

  PreferredSizeWidget _appBarTabDesktop(ThemeProvider _themeProv) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: _themeProv.lightTheme ? Colors.white : Colors.black,
      title: MediaQuery.of(context).size.width < 780
          ? EntranceFader(
              duration: const Duration(milliseconds: 250),
              offset: const Offset(0, -10),
              delay: const Duration(seconds: 3),
              child: NavBarLogo(
                height: 20.0,
              ))
          : EntranceFader(
              offset: const Offset(0, -10),
              duration: const Duration(milliseconds: 250),
              delay: const Duration(milliseconds: 100),
              child: NavBarLogo(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i, _sectionsIcons[i], _themeProv),
        EntranceFader(
          offset: const Offset(0, -10),
          delay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 250),
          child: Container(
            height: 60.0,
            width: 120.0,
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: Theme.of(context).primaryColor.withAlpha(150),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              onPressed: () {
                html.window.open(
                    '',
                    "pdf");
              },
              child: Text(
                "RESUME",
                style: GoogleFonts.montserrat(
                  color: _themeProv.lightTheme ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        SizedBox(
          height: 30.0,
          child: Switch(
            inactiveTrackColor: Colors.grey,
            value: !_themeProv.lightTheme,
            onChanged: (value) {
              _themeProv.lightTheme = !value;
            },
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }

  Widget _appBarMobile(ThemeProvider theme) {
    return Drawer(
      child: Material(
        color: theme.lightTheme ? Colors.white : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text("Dark Mode",
                    style: TextStyle(
                        color: theme.lightTheme ? Colors.black : Colors.white)),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !theme.lightTheme,
                  onChanged: (value) {
                    theme.lightTheme = !value;
                  },
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                _appBarActions(_sectionsName[i], i, _sectionsIcons[i], theme),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: Theme.of(context).primaryColor.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  onPressed: () {
                    launchURL("");
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "RESUME",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        color: theme.lightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SectionsBody extends StatelessWidget {
  final ScrollController scrollController;
  final int sectionsLength;
  final Widget Function(int) sectionWidget;

  const SectionsBody({
    Key? key,
    required this.scrollController,
    required this.sectionsLength,
    required this.sectionWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        // physics: !kIsWeb ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        controller: scrollController,
        itemCount: sectionsLength,
        itemBuilder: (context, index) => sectionWidget(index),
      ),
    );
  }
}