import 'package:flutter/material.dart';
import 'package:second_app/answer.dart';
import 'package:second_app/quiz.dart';
import 'package:second_app/result.dart';
import 'question.dart';
import 'answer.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var w = Colors.white;
var b = Colors.black;

class _MyAppState extends State<MyApp> {
  bool isSwitch = false;
  int _totalScore = 0;
  int _questionIndex = 0;
  int num0 = 0, num1 = 0, num2 = 0;

  void answerQuestion(score) {
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2) num2 = score;

    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print("Question index = $_questionIndex");
    print("Num0 = $num0");
    print("Num1 = $num1");
    print("Num2 = $num2");
    print("Total score = $_totalScore");
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': "What\'s your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 30},
        {'text': 'Green', 'score': 15},
        {'text': 'Red', 'score': 20},
        {'text': 'Yellow', 'score': 10},
        {'text': 'Grey', 'score': 8},
      ]
    },
    {
      'questionText': "What\'s your favorite animal?",
      'answers': [
        {'text': 'Dog', 'score': 30},
        {'text': 'Cat', 'score': 25},
        {'text': 'Lion', 'score': 40},
        {'text': 'Rabbit', 'score': 10},
      ]
    },
    {
      'questionText': "What\'s your favorite serie?",
      'answers': [
        {'text': 'Got', 'score': 50},
        {'text': 'Breaking Bad', 'score': 50},
        {'text': 'Dark', 'score': 30},
        {'text': 'Peaky Blinders', 'score': 20},
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          backgroundColor: Colors.green,
          actions: [
            Switch(
              value: isSwitch,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.black,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                  if (isSwitch == true) {
                    b = Colors.white;
                    w = Colors.black;
                  }
                  if (isSwitch == false) {
                    w = Colors.white;
                    b = Colors.black;
                  }

                  print(isSwitch);
                });
              },
            ),
          ],
        ),
        body: Container(
          color: w,
          width: double.infinity,
          child: _questionIndex < _question.length
              ? Quiz(_question, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            size: 35,
            color: w,
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            setState(() {
              if (_questionIndex == 1) _totalScore -= num0;
              if (_questionIndex == 2) _totalScore -= num1;
              if (_questionIndex == 3) _totalScore -= num2;

              if (_questionIndex > 0) {
                _questionIndex--;
              }
            });
            print("Question index = $_questionIndex");
            print("Num0 = $num0");
            print("Num1 = $num1");
            print("Num2 = $num2");
            print("Total score = $_totalScore");
          },
        ),
      ),
    );
  }
}
