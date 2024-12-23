// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

void main(){
  // WidgetsApp // MaterialApp // CupertinoApp
  runApp(MaterialApp(
    home: const HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var myText = "Change my text";
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.purple,
    //   child: Text("Hi Flutter"),
    // );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("At the Top of the application"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/bg.png",
                    height: 500,
                    // fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20,),
                  Text(myText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(
                  height: 20,
                ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your name",
                        labelText: "Name",
                    )),
                  )
                ]),
            ),
          ),
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
              const UserAccountsDrawerHeader(
                accountName: Text("Niraj Shrestha"), 
                accountEmail: Text("nishrestha776@gmal.com"),
                // currentAccountPicture: Image.file()
                // currentAccountPicture: Image.network("https://iili.io/Jj884Eu.jpg")
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://iili.io/Jj884Eu.jpg"),),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                subtitle: const Text("SubTitle"),
                trailing: const Icon(Icons.edit),
                onTap: () {} ,
              ),
              const ListTile(
              leading: Icon(Icons.person),
              title: Text("Home"),
              subtitle: Text("SubTitle"),
              trailing: Icon(Icons.edit),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("Home"),
              subtitle: Text("SubTitle"),
              trailing: Icon(Icons.edit),
            ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: const Icon(Icons.send),
        // mini: true, // to make the icon smaller
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop, // to move the button to the top or wherever u want
    );
  }
}