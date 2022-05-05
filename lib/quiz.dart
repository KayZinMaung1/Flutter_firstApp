import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  List<Map<String, Object>> questions = [];
  var questionIndex;
  final Function answerQuestion;
  Quiz({required this.questions,required this.questionIndex,required this.answerQuestion});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
          return Answer(()=> answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
