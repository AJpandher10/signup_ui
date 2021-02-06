import 'dart:ui';

import 'package:flutter/material.dart';

// final colorPrimary = const Color(0xFF550026);

class MyColors {
  static Color navy = Color(0xFF162A49);
  static Color colorPrimary = Color(0xFF880043);
  static Color colorPrimaryAccent = Color(0xFF880043);
  static Color colorPrimaryLight = Color(0xFFbd0061);
}

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: isDarkTheme ? Colors.grey.shade900 : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor:
          isDarkTheme ? Colors.white.withOpacity(0.1) : Colors.black38,
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textTheme: TextTheme(

      ),
      cursorColor: isDarkTheme ? Colors.white : Colors.black,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.grey.shade900 : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
