// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/home_screen.dart';
// import 'package:flutter/cupertino.dart';

void main(){
  // WidgetsApp // MaterialApp // CupertinoApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: const HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  );
  }
}