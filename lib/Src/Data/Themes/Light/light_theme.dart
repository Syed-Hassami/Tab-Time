import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightcolorscheme,
    textTheme: LightTextTheme.textThemeStyles(),
  );
}

class AppColors {
  static final ColorScheme lightcolorscheme = ColorScheme(
    brightness: Brightness.light,

    ///main background color
    primary: Color(0xffE2E8F0),

    ///all app buttons colors
    onPrimary: Color(0xff64748B),

    ///take medicin color & allergy text color
    secondary: Color(0xff10B981),

    ///missed medicin colors
    onSecondary: Color(0xffFF3B30),

    ///blood group color
    tertiary: Color(0xffF59E0B),

    ///blood group container color
    onTertiaryContainer: Color(0xffFEF3C7),

    ///on button text color & textfield color
    surface: Color(0xffFFFFFF),

    ///no allergy text color
    onSurface: Color.fromARGB(255, 168, 243, 218),

    ///forget password color & note text color
    error: Color(0xff1E53A4),

    ///main text colors
    onError: Color(0xff1E293B),
  );
}

class LightTextTheme {
  static TextTheme textThemeStyles() => TextTheme(
    ///app bar text
    headlineLarge: GoogleFonts.raleway(
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),

    ///for screen title
    // headlineMedium: GoogleFonts.raleway(
    //   fontWeight: FontWeight.w700,
    //   fontSize: 28,
    // ),

    ///for every section on screen
    headlineSmall: GoogleFonts.raleway(
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),

    ///font family used for onButton
    displayLarge: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w300,
      fontSize: 22,
      // color: AppColors.lightcolorscheme.onSecondary
    ),

    ///font family nunitosans used for subtext after heading
    displayMedium: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w300,
      fontSize: 18,
    ),
  );
}
