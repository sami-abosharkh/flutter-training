import 'package:flutter/material.dart';
import 'Components/CalculateButton.dart';
import 'Components/GenderButton.dart';
import 'Components/HeightCard.dart';
import 'Components/IconButtonComponent.dart';
import 'Model/BMI.dart';
import 'Utility/constants.dart';

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
      home: const BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculator> {
  var BMIModel = BMI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        titleTextStyle: TextStyle(color: Colors.white),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderButton(
                  color: BMIModel.gender == Gender.Male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  lable: "Male",
                  icon: Icons.male,
                  func: () {
                    setState(() {
                      BMIModel.gender = Gender.Male;
                    });
                  },
                ),
                GenderButton(
                  color: BMIModel.gender == Gender.Female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  lable: "Female",
                  icon: Icons.female,
                  func: () {
                    setState(() {
                      BMIModel.gender = Gender.Female;
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
              child: HeightCard(
            height: BMIModel.height,
            onHeightChanged: (int value) {
              setState(() {
                BMIModel.height = value;
              });
            },
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    color: kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: kLabelTextStyle),
                        Text(BMIModel.age.toString().toString(),
                            style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButtonComponent(
                                func: () {
                                  setState(() {
                                    BMIModel.age--;
                                  });
                                },
                                icon: Icons.remove),
                            IconButtonComponent(
                                func: () {
                                  setState(() {
                                    BMIModel.age++;
                                  });
                                },
                                icon: Icons.add)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: kLabelTextStyle),
                        Text(BMIModel.weight.toString(),
                            style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButtonComponent(
                                func: () {
                                  setState(() {
                                    BMIModel.weight--;
                                  });
                                },
                                icon: Icons.remove),
                            IconButtonComponent(
                                func: () {
                                  setState(() {
                                    BMIModel.weight++;
                                  });
                                },
                                icon: Icons.add)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CalcButton(
                  height: BMIModel.height,
                  weight: BMIModel.weight,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
