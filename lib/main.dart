// was supposed to use alerts but could not...

import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'result.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<Icon> scoreKeeper = [];
  var score=0;

  void playSpecificAudio(int audioNum) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    if (audioNum == 1) {
      assetsAudioPlayer.open(
        Audio("assets/audio/tresbien.mp3"),
      ); // assetsAudioPlayer.open
    }

    else if(audioNum == 2) {
      assetsAudioPlayer.open(
        Audio("assets/audio/nevousenfaitespas.mp3"),
      ); // assetsAudioPlayer.open
    }
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(
            () {
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        // Result(score);
        // the 'page' is changing to the show result function output
        quizBrain.reset();
        score=0;

        // quizBrain.reset();
        // the quiz is reset in result.dart

        // removing the list and its manipulation, since I don't want it
        // scoreKeeper = [];
      }

      else {

        if (userPickedAnswer == correctAnswer) {
          // incremented the score
          score=score+1;

          playSpecificAudio(1);

          /*
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ) // Icon
          ); // add
          */
        }

        else {
          playSpecificAudio(2);

          // not going to increment the score here

          /*
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ) // Icon
          ); // add
          */
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    'Language Learning Quiz',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Image(
                    height: 200.0,
                    width: 200.0,
                    image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/375px-Flag_of_France.svg.png'),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(

                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green), enableFeedback: false),

                  // the button sound had been disabled to prevent delay
                  // using 'enableFeedback: false' in the ButtonStyle code segment
                  // in playing the audio assigned but that did not help
                  // the delay is due to something else, I guess

                  child: Text(
                    'VRAI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    //The user picked true.
                    checkAnswer(true);
                  },
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red), enableFeedback: false),

                  // the button sound had been disabled to prevent delay
                  // using 'enableFeedback: false' in the ButtonStyle code segment
                  // in playing the audio assigned but that did not help
                  // the delay is due to something else, I guess

                  child: Text(
                    'FAUX',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    //The user picked false.
                    checkAnswer(false);
                  },
                ),
              ),
            ),

            Row(
              // removed scoreKeeper for now
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                'Total Score: $score',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  )
                ),
              ),
              ],
            )
          ],
        );
  }
}
