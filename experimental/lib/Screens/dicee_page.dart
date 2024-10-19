import 'package:flutter/material.dart';
import 'dart:math';

class DiceePage extends StatelessWidget {
  const DiceePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body: const SafeArea(child: Dice()),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  final random = Random();

  int diceNum1 = 1;
  int diceNum2 = 1;

  void rollDice() {
    setState(() {
      diceNum1 = random.nextInt(6) + 1;
      diceNum2 = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => rollDice(),
                child: Image.asset(
                  "images/dicee/dice$diceNum2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => rollDice(),
                child: Image.asset(
                  "images/dicee/dice$diceNum1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
