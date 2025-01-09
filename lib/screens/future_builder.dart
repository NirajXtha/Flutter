import 'package:flutter/material.dart';
import 'package:test_app/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/screens/login_screen.dart';
import 'dart:convert';

import 'package:test_app/utils/constants.dart'; // to decode json

class HomePageFB extends StatelessWidget {
  static const routeName = "/homefb";
  const HomePageFB({super.key});

  Future fetchData() async {
    final url =
        Uri.parse("https://dummyjson.com/products/search?q=phone&limit=10");
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Future Builder"),
        actions: [
          IconButton(
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: FutureBuilder(
          future: fetchData(),
          // future: null, // For when the data trying to be fetched is null => ConnectionState.none
          // initialData: ,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text("Fetch Something. Connection State None!"),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Some Error Occured!!"),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    // context is the context of the widget | location in simple terms, index is the index of the item
                    return ListTile(
                      title: Text(snapshot.data['products'][index]['title']),
                      subtitle: Text(
                          "Description: ${snapshot.data["products"][index]["description"]}"),
                      leading: Image.network(
                          snapshot.data["products"][index]["thumbnail"]),
                    );
                  },
                  itemCount: snapshot.data["products"].length,
                );
            }
          }),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.refresh),
        // mini: true, // to make the icon smaller
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop, // to move the button to the top or wherever u want
    );
  }
}
