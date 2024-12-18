// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

void main(){
  // WidgetsApp // MaterialApp // CupertinoApp
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.purple,
    //   child: Text("Hi Flutter"),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("At the Top of the application"),
      ),
      body: Container(
        color: Colors.teal,
        height: 200,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.red,
              width: 100,
              height: 100,
              alignment: Alignment.center,
              ),
              Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.purple,
              width: 100,
              height: 100,
              alignment: Alignment.center,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue,
              width: 100,
              height: 100,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}