import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  int chatId = 0;

  void setChatId(int id) {
    chatId = id;
    notifyListeners();
  }
}
