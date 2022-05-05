import 'package:first_app/result.dart';

import './answer.dart';
import './quiz.dart';
import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'black', 'score': 5},
        {'text': 'red', 'score': 4},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'snake', 'score': 5},
        {'text': 'elephant', 'score': 4},
        {'text': 'cat', 'score': 3},
        {'text': 'dog', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': [
        {'text': 'John', 'score': 5},
        {'text': 'Smith', 'score': 4},
        {'text': 'David', 'score': 3},
        {'text': 'Avar', 'score': 3},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more question");
    }
  }

  void _resetQuiz(){
   setState(() {
     _questionIndex = 0;
    _totalScore = 0;
   });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('My first App')),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore,_resetQuiz),
      )
    );
  }
}
