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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _heightSliderValue = 170;
  double _weightSliderValue = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Text(
              "BMI Calculator",
              style: TextStyle(fontSize: 32, color: Colors.red),
            ),
            SizedBox(height: 8,),
            Text("We care about your health", style: TextStyle(fontSize: 24),),
            SizedBox(height: 8,),
            Image.network("https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg"),
            SizedBox(height: 8,),
            Text("Height ( ${_heightSliderValue.round()} cm)", style: TextStyle(fontSize: 20),),
            SizedBox(height: 8,),
            Slider(
              value: _heightSliderValue,
              max: 200,
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              },
            ),
            SizedBox(height: 8,),
            Text("Weight (${_weightSliderValue.round()}kg)", style: TextStyle(fontSize: 20),),
            Slider(
              value: _weightSliderValue,
              max: 180,
               onChanged: (double value) {
                setState(() {
                  _weightSliderValue = value;
                });
              },
            ),
            SizedBox(height: 8,),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.favorite), label: Text("Calculate BMI"))
          ],
        )
    );
  }
}
