// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/future_builder.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/login_screen.dart';
import 'package:test_app/utils/constants.dart';
// import 'package:flutter/cupertino.dart';

void main(){
  // WidgetsApp // MaterialApp // CupertinoApp
  WidgetsFlutterBinding.ensureInitialized();
  // Constants.prefs = await SharedPreferences.getInstance();
  Constants();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Constants.prefs.getBool("loggedIn") == true ? const HomePageFB() : const LoginScreen(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
      LoginScreen.routeName: (context) => const LoginScreen(),
      HomePage.routeName: (context) => const HomePage(),
      HomePageFB.routeName: (context) => const HomePageFB(),
    },
  );
  }
}