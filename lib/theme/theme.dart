import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Color(0xFFFAFAFA),
      onBackground: Color(0xFFC2E7FF),
      primary: Colors.white,
      outline: Color(0xFF40414f),
      secondary: Colors.black,
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Colors.black,
      onBackground: Color(0xFF202123),
      primary: Color(0xFF131619),
      outline: Color(0xFFD1D5DB),
      secondary: Colors.white,
    ));
