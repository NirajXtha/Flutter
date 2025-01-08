import 'package:flutter/material.dart';
import 'package:test_app/screens/drawer.dart';
import 'package:test_app/widgets/name_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change my text";
  final TextEditingController _nameController = TextEditingController();

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
            child:
                NameCardWidget(myText: myText, nameController: _nameController),
          ),
        ),
      ),
      drawer: const MyDrawer(),
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
