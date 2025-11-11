import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF6C6EC), Color(0xFFEE80D2), Color(0xFFF5CAFC)],
          ),
        ),
        child: Column(children: [Image.asset('assets/cloud.png')]),
      ),
    );
  }
}
