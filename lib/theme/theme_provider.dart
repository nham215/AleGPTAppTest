import 'package:flutter/material.dart';
import 'package:learn/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void onLightMode() {
    themeData = lightMode;
  }

  void onDarkMode() {
    themeData = darkMode;
  }
}
