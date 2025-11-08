import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App (Day 3)")),

      body: Center(
        child: Text(
          "You have pressed $count times",
          style: TextStyle(fontSize: 24),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          
          setState(() {
            count++;
          });
          //count = count+1;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
