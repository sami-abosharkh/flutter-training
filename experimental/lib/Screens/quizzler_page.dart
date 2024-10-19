import 'package:flutter/material.dart';
import '../Repository/QuizRepository.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Quiz()),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuizRepository quizRepo = QuizRepository();
  late int index;
  late int total;
  late int score;

  @override
  void initState() {
    total = quizRepo.GetQuestionsAmount();
    index = 0;
    score = 0;
    super.initState();
  }

  String _CurrentQuestionText() => quizRepo.GetQuestionText(index);
  bool _CurrentQuestionAnswer() => quizRepo.GetQuestionAnswer(index);

  void _ScoreHandler(bool input) {
    if (index >= total) return;

    if (input == _CurrentQuestionAnswer()) {
      score++;
    }
  }

  void _NextSection() {
    if (index < total) {
      setState(() {
        index++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Completed'),
            content: Text('Your score is $score out of $total.'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                    score = 0;
                  });
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Restart'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(
              "$total/$index",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                _CurrentQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 50,
          child: Divider(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.green, // background (button) color
                foregroundColor: Colors.white, // text (and icon) color
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // No rounded corners
                ),
              ),
              onPressed: () {
                _ScoreHandler(true);
                _NextSection();
              },
              child: const Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.red, // background (button) color
                foregroundColor: Colors.white, // text (and icon) color
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // No rounded corners
                ),
              ),
              onPressed: () {
                _ScoreHandler(false);
                _NextSection();
              },
              child: const Text('False'),
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}
