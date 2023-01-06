class Question {
  String _question;
  bool _answer;

  Question(this._question, this._answer);

  void setQuestion(String q) => _question = q;
  void setAnswer(bool a) => _answer = a;
  String getQuestion() => _question;
  bool getAnswer() => _answer;
}
