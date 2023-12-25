import 'package:flutter/material.dart';
import 'package:learn/screens/home_screen.dart';
import 'package:learn/screens/login_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.routeName: (ctx) => const LoginScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
};
