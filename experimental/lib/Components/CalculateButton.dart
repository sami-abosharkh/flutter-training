import 'package:flutter/material.dart';
import '../Service/BMI_Calc.dart';
import '../Utility/SD.dart';

class CalcButton extends StatefulWidget {
  const CalcButton({
    super.key,
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;

  @override
  State<CalcButton> createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: kBottomContainerColour, // background (button) color
          foregroundColor: Colors.white, // text (and icon) color
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // No rounded corners
          ),
        ),
        onPressed: () {
          CalculatorBrain calc =
              CalculatorBrain(height: widget.height, weight: widget.weight);
          String calculationValue = calc.calculateBMI();
          String calculationResult = calc.getResult();
          String calculationDescription = calc.getInterpretation();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(calculationResult),
                content: Text("$calculationValue, $calculationDescription"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: const Text("Calculate"));
  }
}
