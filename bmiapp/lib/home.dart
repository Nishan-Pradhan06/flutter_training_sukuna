import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double? bmi ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: heightController,
              decoration: InputDecoration(
                hintText: "Enter your height in meter",
              ),
            ),
            SizedBox(height: 12),

            TextField(
              controller: weightController,
              decoration: InputDecoration(hintText: "Enter your weight in kg"),
            ),

            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                double height = double.parse(heightController.text);
                double weight = double.parse(weightController.text);

                setState(() {
                  bmi = weight / (height * height);
                });
              },
              child: Text("Calculate BMI"), 
            ),
            SizedBox(height: 24),

            if (bmi != null) Text("Your BMI is $bmi"),
          ],
        ),
      ),
    );
  }
}
