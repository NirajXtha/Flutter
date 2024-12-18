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
          color: Colors.teal,
          height: 100,
          width: 100,
        ),
      ),
      drawer: Drawer(
          // key: Key("Drawer"),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
              // DrawerHeader(
              //   child: Text("Drawer Header"),
              //   decoration: BoxDecoration(color: Colors.blue),
              // ),
              UserAccountsDrawerHeader(
                accountName: Text("Niraj Shrestha"), 
                accountEmail: Text("nishrestha776@gmal.com"),
                // currentAccountPicture: Image.file()
                // currentAccountPicture: Image.network("https://iili.io/Jj884Eu.jpg")
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://iili.io/Jj884Eu.jpg"),),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                subtitle: Text("SubTitle"),
                trailing: Icon(Icons.edit),
                onTap: () {} ,
              ),
              ListTile(
              leading: Icon(Icons.person),
              title: Text("Home"),
              subtitle: Text("SubTitle"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Home"),
              subtitle: Text("SubTitle"),
              trailing: Icon(Icons.edit),
            ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        // mini: true, // to make the icon smaller
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop, // to move the button to the top or wherever u want
    );
  }
}