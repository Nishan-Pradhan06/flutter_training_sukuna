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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (int i = 0; i < productList.length; i++)
            Card(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "Image",
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Text(
                        "Your title ${productList[i]}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("dEscription"),
                      Text("Price \$ 100"),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

List<String> productList = ["Samsung", "Samsung ultra"];
