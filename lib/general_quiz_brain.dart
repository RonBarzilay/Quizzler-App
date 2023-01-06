import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GeneralQuizBrain {
  int _questionTracker = 0;
  List<Question> _questionsBank = [
    Question('?האם אני גאון', true),
    Question('?האם אני מוכשר', true),
    Question('?האם 8+(14^87)-2 מספר זוגי', false)
  ];

  void nextQuestion(BuildContext context) {
    if (_questionTracker == _questionsBank.length - 1) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "The End",
        desc: "You've reached to the end of Quizller",
        buttons: [
          DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {Navigator.pop(context)},
            width: 120,
          )
        ],
      ).show();
    }
    _questionTracker++;
  }

  bool isGameOver() {
    /// This Method check if game is over by reaching end of questions in bank
    if (_questionTracker < _questionsBank.length) {
      return false;
    } else {
      resetGame();
      return true;
    }
  }

  void resetGame() {
    _questionTracker = 0;
  }

  Question getCurrentQuestion() => _questionsBank[_questionTracker];
  int length() => _questionsBank.length;
}
