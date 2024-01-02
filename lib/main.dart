import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn/routes.dart';
import 'package:learn/screens/home_screen.dart';
import 'package:learn/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learn/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT Ale',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: darkMode,
      darkTheme: darkMode,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return const LoginScreen();
            } else {
              return HomeScreen(
                  name: FirebaseAuth.instance.currentUser!.displayName!);
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // home: const LoginScreen(),
    );
  }
}
