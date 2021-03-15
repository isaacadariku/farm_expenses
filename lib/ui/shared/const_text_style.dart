import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const_color.dart';
import 'screen_size.dart';

/// -
TextStyle kHeaderTextStyle(BuildContext context, {Color color, double size}) => GoogleFonts.lato(
      color: color ?? ThemeColors.kWhite,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: SizeConfig.textSize(context, size ?? 8),
    );

/// -
TextStyle kSubHeadingTextStyle(BuildContext context, {Color color, @required bool isNormal}) => GoogleFonts.lato(
      color: color,
      fontStyle: FontStyle.normal,
      fontWeight: isNormal ? FontWeight.normal : FontWeight.w600,
      fontSize: SizeConfig.textSize(context, 5),
    );

/// -
TextStyle kBodyTextStyle(BuildContext context, {Color color}) => GoogleFonts.lato(
      color: color  ?? ThemeColors.kBlack,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: SizeConfig.textSize(context, 4),
    );

/// -
TextStyle kButtonTextStyle(BuildContext context, {@required Color color}) => GoogleFonts.lato(
      color: color ,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: SizeConfig.textSize(context, 2.5),
    );
