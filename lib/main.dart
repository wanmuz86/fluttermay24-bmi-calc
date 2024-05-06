import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculatoe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// _ here is naming convention for global variable / not part of the syntax
  double _heightSliderValue = 170;
  double _weightSliderValue = 70;
  var _bmi = 0;
  var _message ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            const Text(
              "BMI Calculator",
              style: TextStyle(fontSize: 32, color: Colors.red),
            ),
            const SizedBox(height: 8,),
            const Text("We care about your health", style: TextStyle(fontSize: 24),),
            const SizedBox(height: 8,),
            Image.network("https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg"),
            const SizedBox(height: 8,),
            Text("Height ( ${_heightSliderValue.round()} cm)", style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 8,),
            Slider(
              value: _heightSliderValue,
              max: 200,
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              },
            ),
            const SizedBox(height: 8,),
            Text("Weight (${_weightSliderValue.round()}kg)", style: const TextStyle(fontSize: 20),),
            Slider(
              value: _weightSliderValue,
              max: 180,
               onChanged: (double value) {
                setState(() {
                  _weightSliderValue = value;
                });
              },
            ),
            const SizedBox(height: 8,),
            _bmi != 0 ? Text("Your BMI is $_bmi") : const SizedBox(),
            _message != "" ? Text(_message) : const SizedBox(),
            const SizedBox(height: 8,),
            ElevatedButton.icon(onPressed: (){
              // weight / (height in meter)^2
              var tempBmi = _weightSliderValue / pow((_heightSliderValue/100),2);
              print(tempBmi);
              // It means assign tempBmi into _bmi
             // _bmi = tempBmi;
              var tempMessage = "";
              if (tempBmi < 18.5){
                tempMessage = "You are underweight";
              }
              else if (tempBmi < 25){
                tempMessage = "You are normal";
              }
              else if (tempBmi < 30){
                tempMessage = "You are overweight";
              }
              else if (tempBmi < 35) {
                tempMessage = "You are obese";
              }
              else {
                tempMessage = "You are extremely obese";
              }

              // Assign tempBmi into _bmi AND REFRESH THE PART OF UI THAT HAS THE VALUE
              setState(() {
                _bmi = tempBmi.round();
                _message = tempMessage;
              });


            }, icon: const Icon(Icons.favorite), label: const Text("Calculate BMI"))
          ],
        )
    );
  }
}
