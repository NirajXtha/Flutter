import 'package:flutter/material.dart';
import 'widgets/counter_widget.dart';
import 'widgets/info_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using our custom widgets
            InfoCard(
              title: 'Welcome',
              description: 'This is a sample card',
            ),
            SizedBox(height: 20), // Adds some spacing
            CounterWidget(),
          ],
        ),
      ),
    );
  }
}
