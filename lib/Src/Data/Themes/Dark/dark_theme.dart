import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkcolorscheme,
    textTheme: DarkTextTheme.textThemeStyles(),
  );
}

class AppColors {
  static final ColorScheme darkcolorscheme = ColorScheme(
    brightness: Brightness.dark,

    /// main background color
    primary: Color(0xff0F172A),

    /// all app buttons colors
    onPrimary: Color(0xff475569),

    /// take medicine color
    secondary: Color(0xff10B981),

    /// missed medicine color
    onSecondary: Color(0xffFF453A),

    /// blood group color
    tertiary: Color(0xffF59E0B),

    /// blood group container color
    onTertiaryContainer: Color(0xff422006),

    /// on button text color & textfield color
    surface: Color(0xff1E293B),

    /// no allergy text color
    onSurface: Color(0xff34D399),

    /// forget password color & note text color
    error: Color(0xff60A5FA),

    /// main text colors
    onError: Color(0xffF8FAFC),
  );
}

class DarkTextTheme {
  static TextTheme textThemeStyles() => TextTheme(
    /// app bar text
    headlineLarge: GoogleFonts.raleway(
      fontWeight: FontWeight.w700,
      fontSize: 28,
      color: Color(0xffF8FAFC),
    ),

    /// screen title
    // headlineMedium: GoogleFonts.raleway(
    //   fontWeight: FontWeight.w700,
    //   fontSize: 28,
    //   color: Color(0xffF8FAFC),
    // ),

    /// every section on screen
    headlineSmall: GoogleFonts.raleway(
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),

    /// font family used for buttons
    displayLarge: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w300,
      fontSize: 22,
    ),

    /// font family Nunito Sans used for subtext
    displayMedium: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w300,
      fontSize: 19,
    ),
  );
}
