import 'package:flutter/material.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

class SocialMediaIconBtn extends StatelessWidget {
  final String icon;
  final String socialLink;
  final double height;
  final double horizontalPadding;

  const SocialMediaIconBtn(
      {Key? key,
      required this.icon,
      required this.socialLink,
      required this.height,
      required this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        icon: Image.network(
          icon,
          color: Theme.of(context).textTheme.bodyText1?.color,
        ),
        iconSize: height,
        onPressed: () => launchURL(socialLink),
        hoverColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
