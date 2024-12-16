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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [Colors.pink, Colors.yellow]),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 10,
              )
            ]
          ),
          child: Text("This a box", 
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              
            ),),
        ),
      ),
    );
  }
}