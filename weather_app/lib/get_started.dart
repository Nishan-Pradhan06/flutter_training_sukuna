import 'package:flutter/material.dart';
import 'package:weather_app/weather_page.dart';

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
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [Color(0xFF20284d), Color(0xFF453b91), Color(0xFF9342ab)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cloud.png', height: 400, width: 400),

            Text(
              "Weather",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "ForeCasts",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Color(0xFFcda33f),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 50,
              // width: 70,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WeatherPage()),
                  );
                },
                child: Text(
                  "Get started",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

