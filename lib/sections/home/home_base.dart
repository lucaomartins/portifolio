import 'package:flutter/material.dart';
import 'package:portfolio/animations/entrance_fader.dart';
import 'package:portfolio/constants.dart';

abstract class BaseHomePage extends StatelessWidget {
  const BaseHomePage({Key? key}) : super(key: key);

  double? getPositionedRight(width, height);
  double? getPositionedTop(width, height);
  double? getPositionedBottom(width, height);
  double? getImageHeight(width, height);
  EdgeInsetsGeometry? getHeaderMargin(width, height);
  String get welcomeText => "WELCOME TO MY PORTFOLIO! ";
  double? getWelcomeFontSize(width, height);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                Positioned(
                  top: getPositionedTop(width, height),
                  bottom: getPositionedBottom(width, height),
                  right: getPositionedRight(width, height),
                  child: Opacity(
                    opacity: 0.9,
                    child: EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 1),
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(
                        'assets/profile.png',
                        height: getImageHeight(width, height),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: getHeaderMargin(width, height),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            welcomeText,
                            style: Theme.of(context).textTheme.headline3?.copyWith(
                              fontSize: getWelcomeFontSize(width, height),
                            ),
                          ),
                          // TODO: Add some icon gif here
                        ],
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Text(
                        developerName,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        developerLastname,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
