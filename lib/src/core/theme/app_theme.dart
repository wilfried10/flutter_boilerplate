import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/theme/color_schemes.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData _buildTheme({required Brightness brightness}) {
    final ColorScheme colors =
        brightness == Brightness.light ? lightColorScheme : darkColorScheme;

    return ThemeData(
        useMaterial3: true,
        textTheme: _buildTextTheme(colors: colors),
        colorScheme: colors,
        appBarTheme: AppBarTheme(backgroundColor: colors.background),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(fontSize: 0),
          unselectedLabelStyle: TextStyle(fontSize: 0),
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 3, color: colors.outlineVariant),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 3, color: colors.primary),
            ),
            labelStyle: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: colors.onBackground),
            )));
  }

  static TextTheme _buildTextTheme({required ColorScheme colors}) {
    return TextTheme(
      bodyMedium: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
      bodySmall: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontSize: 11,
        ),
      ),
      bodyLarge: GoogleFonts.nunito(
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
      titleLarge: GoogleFonts.nunito(
        textStyle: TextStyle(
            fontSize: 36, fontWeight: FontWeight.w700, color: colors.secondary),
      ),
      titleSmall: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      headlineMedium: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      displayMedium: GoogleFonts.inter(
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      ),
      titleMedium: GoogleFonts.nunito(
        textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = _buildTheme(brightness: Brightness.dark);
}
