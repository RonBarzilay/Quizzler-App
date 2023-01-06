import 'package:flutter/material.dart';
import 'package:quizzler/general_quiz_brain.dart';

void main() => runApp(Quizzler());

GeneralQuizBrain generalQuestionBank = GeneralQuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  List<Icon> scoreKeeper = [];

  void nextQuestion(BuildContext context) {
    setState(() {
      generalQuestionBank.nextQuestion(context);
    });
  }

  void checkAnswer(bool valueToCheck) {
    if (generalQuestionBank.getCurrentQuestion().getAnswer() == valueToCheck)
      setState(() {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      });
    else
      setState(() {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                generalQuestionBank.getCurrentQuestion().getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  // The user picked true.
                  checkAnswer(true);
                  nextQuestion(context);
                  if (generalQuestionBank.isGameOver() == true) {
                    scoreKeeper.clear();
                  }
                  ;
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // The user picked false.
                checkAnswer(false);
                nextQuestion(context);
                if (generalQuestionBank.isGameOver() == true) {
                  scoreKeeper.clear();
                }
              },
            ),
          ),
        ),
        Container(child: Row(children: scoreKeeper))
      ],
    );
  }
}
