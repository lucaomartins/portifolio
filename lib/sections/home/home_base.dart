import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/animations/entrance_fader.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/widgets/social_media_icon.dart';
import 'package:provider/provider.dart';

abstract class BaseHomePage extends StatelessWidget {
  const BaseHomePage({Key? key}) : super(key: key);

  double? getPositionedRight(width, height);

  double? getPositionedTop(width, height);

  double? getPositionedBottom(width, height);

  double? getImageHeight(width, height);

  EdgeInsetsGeometry? getHeaderMargin(width, height);

  String get welcomeText => "LIVE LONG AND PROSPER! ";

  double? getWelcomeFontSize(width, height);

  double? getNameFontSize(width, height);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
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
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: getNameFontSize(width, height)),
                  ),
                  Text(
                    developerLastname,
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: getNameFontSize(width, height),
                          color:
                              _themeProvider.lightTheme ? Colors.black : cyan,
                        ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      TyperAnimatedTextKit(
                        isRepeatingAnimation: true,
                        speed: const Duration(milliseconds: 50),
                        textStyle: GoogleFonts.montserrat(
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.w200,
                          color: Theme.of(context).textTheme.headline3?.color,
                        ),
                        text: mainSkills,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.045,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < kSocialIcons.length; i++)
                        SocialMediaIconBtn(
                          icon: kSocialIcons[i],
                          socialLink: kSocialLinks[i],
                          height: height * 0.035,
                          horizontalPadding: width * 0.01,
                        )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
