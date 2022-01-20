import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants.dart';

class NavBarLogo extends StatelessWidget {
  final double? height;
  const NavBarLogo({Key? key, this.height}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width < 1100 ? 0.0 : 20.0, 20.0, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "< ",
            style: GoogleFonts.jetBrainsMono(
              fontSize: height ?? 20,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
          Text(
            developerCompleteName,
            style: GoogleFonts.audiowide(
              fontSize: height ?? 20,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
          Text(
            MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
            style: GoogleFonts.jetBrainsMono(
              fontSize: height ?? 20,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          )
        ],
      ),
    );
  }
}
