import 'package:flutter/material.dart';
import 'package:test_app/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/screens/login_screen.dart';
import 'dart:convert';

import 'package:test_app/utils/constants.dart'; // to decode json

class HomePageSB extends StatelessWidget {
  static const routeName = "/homesb";
  const HomePageSB({super.key});

  Future fetchData() async {
    final url =
        Uri.parse("https://dummyjson.com/products/search?q=phone&limit=10");
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    return data;
  }

  Stream<List<String>> getStream() {
    var data = Stream<List<String>>.fromIterable([List<String>.generate(20, (index) => "Item: ${index + 1}")]); // to generate a stream of data
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Stream Builder"),
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
      body: StreamBuilder(
          stream: getStream(),
          initialData: null,
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
                      title: Text("${snapshot.data?[index]}"),
                    );
                  },
                  itemCount: snapshot.data?.length,
                );
            }
          }),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getStream();
        },
        child: const Icon(Icons.refresh),
        // mini: true, // to make the icon smaller
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop, // to move the button to the top or wherever u want
    );
  }
}
