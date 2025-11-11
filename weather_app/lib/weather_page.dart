// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/weather.dart';

// condition?true:false
//age = 14 terminary operator
// age<18? print("ho"): print("hoina")

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key, required this.cityName}) : super(key: key);
  final String cityName;
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather? weather;
  void getWeather() async {
    try {
      var response = await Dio().get(
        "https://api.weatherapi.com/v1/current.json?q=${widget.cityName}&key=cea57194c4c54658a6533401251111",
      );

      final data = response.data;

      setState(() {
        weather = Weather.fromMap(data);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: weather == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [
                    Color(0xFF20284d),
                    Color(0xFF453b91),
                    Color(0xFF9342ab),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Image.asset('assets/cloud.png', height: 200),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather!.tempInCelsious.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'o',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    weather!.currentCondition,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                  // Row(
                  //   spacing: 20,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Row(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'Max: 24',
                  //           style: TextStyle(
                  //             // fontWeight: FontWeight.bold,
                  //             fontSize: 17,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //         Align(
                  //           alignment: Alignment.topLeft,
                  //           child: Text(
                  //             'o',
                  //             style: TextStyle(
                  //               // fontWeight: FontWeight.bold,
                  //               fontSize: 8,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'Min: 24',
                  //           style: TextStyle(
                  //             // fontWeight: FontWeight.bold,
                  //             fontSize: 17,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //         Align(
                  //           alignment: Alignment.topLeft,
                  //           child: Text(
                  //             'o',
                  //             style: TextStyle(
                  //               // fontWeight: FontWeight.bold,
                  //               fontSize: 8,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Spacer(),
                  Image.asset('assets/house.png', height: 200),
                ],
              ),
            ),
    );
  }
}




/*


{
  "location": {
    "name": "Biratnagar",
    "region": "",
    "country": "Nepal",
    "lat": 26.4833,
    "lon": 87.2833,
    "tz_id": "Asia/Kathmandu",
    "localtime_epoch": 1762833150,
    "localtime": "2025-11-11 09:37"
  },
  "current": {
    "last_updated_epoch": 1762832700,
    "last_updated": "2025-11-11 09:30",
    "temp_c": 22.8,
    "temp_f": 73.1,

    "is_day": 1,
    "condition": {
      "text": "Sunny",
      "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
      "code": 1000
    },
    "wind_mph": 5.6,
    "wind_kph": 9,
    "wind_degree": 270,
    "wind_dir": "W",
    "pressure_mb": 1014,
    "pressure_in": 29.95,
    "precip_mm": 0,
    "precip_in": 0,
    "humidity": 66,
    "cloud": 2,
    "feelslike_c": 24.9,
    "feelslike_f": 76.8,
    "windchill_c": 22.8,
    "windchill_f": 73.1,
    "heatindex_c": 24.9,
    "heatindex_f": 76.8,
    "dewpoint_c": 16.1,
    "dewpoint_f": 61,
    "vis_km": 10,
    "vis_miles": 6,
    "uv": 3.1,
    "gust_mph": 6.6,
    "gust_kph": 10.5,
    "short_rad": 264.94,
    "diff_rad": 58.92,
    "dni": 0,
    "gti": 58.61
  }
}
*/