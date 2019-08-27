class QuizModel {
  String question;
  List<String> choices = List<String>();
  String rightAnswer;

  QuizModel.fromMap(Map m) {
    this.question = m['question'];
    m['choices'].forEach((c) => choices.add(c));
    this.rightAnswer = m['rightAnswer'];
  }
}
