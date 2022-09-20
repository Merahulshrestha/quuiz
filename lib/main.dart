// You should remove const before widget property, then only  red line on onpressed will go
// while creating function, you need to add return also otherwise it will give you an error
//specifiy the type of function while creating it
// after creating class we have to initialize and import it before using its property
// i need to work on my functions
// don't put if else statements or logic inside setstate
//payattention to variable names, iget confused
import 'package:flutter/material.dart';
import 'package:quiz_app_practice/question.dart';
import 'package:quiz_app_practice/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: MyApp(),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scorekeeper = [];

  void checkedAnswer(bool unserPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (unserPickedAnswer == correctAnswer) {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      quizBrain.getNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // we have to display question here
                quizBrain.getQuestionText(),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  checkedAnswer(true);
                },
                child: const Text('True'),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TextButton(
                // style: TextButton.styleFrom(
                //   textStyle: const TextStyle(fontSize: 20),
                // ),
                onPressed: () {
                  checkedAnswer(false);
                },
                child: const Text('False'),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
