// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class Result extends StatelessWidget {
  final int resultScore;
  // final Function resetHandler;

// removed 'this.resetHandler'
  const Result(this.resultScore, {Key? key})
      : super(key: key);

  //Remark Logic
  String get resultPhrase {
    String resultText='';
    // total score is out of 13

    if (resultScore >= 0 && resultScore<=4) {
      resultText = 'You need a lot of practice!';
      print(resultScore);
    }

    else if (resultScore >= 5 && resultScore<=9) {
      resultText = 'Could be better!';
      print(resultScore);
    }

    else if (resultScore >= 10) {
      resultText = 'Good work!';
      print(resultScore);
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text

          Text(
            'Score ' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          TextButton(
            onPressed: () {
              quizBrain.reset();
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),

        ],
      ),
    );
  }
}