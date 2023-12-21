import 'package:flutter/material.dart';
import 'package:learn/routes.dart';
import 'package:learn/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

enum Person { tin, hoa, phuong }
// Person.tin.name
// Person.values.length
// Person.values[0]
// Person.values.first
// Person.values.last
// Person.values.isEmpty
// Person.values.isNotEmpty

// Person.values.forEach((e){
//  print(e.name)
// })

var numbers = Iterable.generate(10);
// numbers.forEach((number){
//  print(number);
// })

// for (int i = 0; i < numbers.lenth; i++) {
//  print(numbers.elementAt(i));
// }

// for (var numver in numbers) {
//  print(number);
// }

var list = [];
// list.add(1); //them phan tu

List<int> listNumber = [];
// listNumber.add(2);

var map = {};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
