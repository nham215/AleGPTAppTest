import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late int userId;

  void setUserId(int id) {
    userId = id;
    notifyListeners();
  }
}
