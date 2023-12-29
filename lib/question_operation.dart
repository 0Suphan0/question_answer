import 'package:question_answer/question.dart';

class QuestionOperation {

  int questionCounter = 0;
  final List<Question> _questions = [
    Question(
        questionId: 0,
        question: "Titanic gelmiş geçmiş en büyük gemidir.",
        isTrue: false),
    Question(
        questionId: 1,
        question: "Dünyadaki tavuk sayısı insan sayısından fazladır.",
        isTrue: true),
    Question(
        questionId: 2,
        question: "Kelebeklerin ömrü bir gündür.",
        isTrue: false),
    Question(questionId: 3, question: "Dünya düzdür.", isTrue: false),
    Question(
        questionId: 4,
        question: "Kaju fıstığı aslında bir meyvenin sapıdır.",
        isTrue: true),
    Question(
        questionId: 5,
        question: "Fatih Sultan Mehmet hiç patates yememiştir.",
        isTrue: true),
  ];

  List<Question> getQuestionList() {
    return _questions;
  }

  String? getQuestion(){
    return _questions[questionCounter].question;
  }

  bool? getTrueFalse(){
    return _questions[questionCounter].isTrue;
  }

  void incCounter(){
    if(questionCounter<_questions.length-1)
    questionCounter++;
  }

}
