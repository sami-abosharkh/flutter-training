import 'package:flutter/material.dart';
import 'package:experimental/Screens/profile_page.dart';
import 'Screens/bmiCalculator_page.dart';
import 'Screens/dicee_page.dart';
import 'Screens/quizzler_page.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Experimental")),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    // Handle the tap event here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No rounded corners
                    ),
                  ),
                  child: const Text(
                    'Profile Page',
                    style: TextStyle(fontSize: 16),
                  )),
              ElevatedButton(
                  onPressed: () {
                    // Handle the tap event here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DiceePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No rounded corners
                    ),
                  ),
                  child: const Text(
                    'Dicee Page',
                    style: TextStyle(fontSize: 16),
                  )),
              ElevatedButton(
                  onPressed: () {
                    // Handle the tap event here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No rounded corners
                    ),
                  ),
                  child: const Text(
                    'Quizzler Page',
                    style: TextStyle(fontSize: 16),
                  )),
              ElevatedButton(
                  onPressed: () {
                    // Handle the tap event here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BMICalculatorPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No rounded corners
                    ),
                  ),
                  child: const Text(
                    'BMI Calculator Page',
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
        ));
  }
}
