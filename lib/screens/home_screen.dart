import 'package:flutter/material.dart';
import 'package:test_app/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // to decode json

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var myText = "Change my text";
  // final TextEditingController _nameController = TextEditingController();

  var url = Uri.parse("https://dummyjson.com/products/search?q=phone&limit=10");
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

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
      body: data != null 
      ? ListView.builder(
        itemBuilder: (context, index) { // context is the context of the widget | location in simple terms, index is the index of the item
          return ListTile(
            title: Text(data["products"][index]["title"]),
            subtitle: Text("Description: ${data["products"][index]["description"]}"),
            leading: Image.network(data["products"][index]["thumbnail"]),
          );
        },
        itemCount: data["products"].length,
      ) 
      : const Center(
          child: CircularProgressIndicator()
        ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          setState(() {});
        },
        child: const Icon(Icons.send),
        // mini: true, // to make the icon smaller
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop, // to move the button to the top or wherever u want
    );
  }
}
