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
      title: 'Flutter Demo',
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
            Text("We care about your health"),
            Image.network("https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg"),
            Text("Height (170cm)"),
            Text("Weight (70kg)"),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.favorite), label: Text("Calculate BMI"))
          ],
        ));
  }
}
