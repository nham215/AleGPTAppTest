import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      onBackground: Color(0xFFC2E7FF),
      primary: Color(0xFFFAFAFA),
      outline: Color(0xFF40414f),
      secondary: Colors.black,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF090B0C),
      onBackground: Color(0xFF202123),
      primary: Color(0xFF131619),
      outline: Color(0xFFD1D5DB),
      secondary: Colors.white,
    ));
