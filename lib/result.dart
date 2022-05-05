import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore,this.resetHandler);
  String get resultPhrase {
    var resultPhrase = "You did it!";
    if (resultScore <= 8) {
      resultPhrase = "You are awesome and innocent.";
    } else if (resultScore <= 12) {
      resultPhrase = "Pretty likeable.";
    } else if (resultScore <= 16) {
      resultPhrase = "Your are ....strange.";
    } else {
      resultPhrase = "You are so bad.";
    }
    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(onPressed: resetHandler, child: Text('Reset Quiz!'))
      ],
    );
  }
}
