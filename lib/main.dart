import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Day 2",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),

      body: Row(
        children: [
          Expanded(child: Container(height: 200, color: Colors.red)),

          SizedBox(width: 20),

          Expanded(child: Text("Hello")),
        ],
      ),
    );
  }
}
