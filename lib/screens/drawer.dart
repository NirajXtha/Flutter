import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          // key: Key("Drawer"),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
              // DrawerHeader(
              //   child: Text("Drawer Header"),
              //   decoration: BoxDecoration(color: Colors.blue),
              // ),
              const UserAccountsDrawerHeader(
                accountName: Text("Username"), 
                accountEmail: Text("username@gmal.com"),
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
        );
  }
}