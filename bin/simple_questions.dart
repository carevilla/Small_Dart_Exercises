import 'dart:io';
import 'dart:core';

abstract class Question{
  dynamic question;
  dynamic answer;
  Question(this.question , this.answer);

  void printQuestion(){
  }
}

class QuestionMultiple extends Question{
  dynamic answerChoices;
  QuestionMultiple(question , answer , this.answerChoices) : super(question , answer);


  String get getAnswerChoices => answerChoices;
  set setAnswerChoices(var x){
    answerChoices = x;
  }

  @override
  void printQuestion(){
    print(question);
  }

  void printAnswerChoices(){
    for(int i=0; i<answerChoices.length; i++){
      int questionNum = i + 1;
      var c = answerChoices[i];
      print('$questionNum) $c');
    }
  }
}

class FillInBlankQuestion extends Question{
  dynamic userAnswer;
  FillInBlankQuestion(question , answer , this.userAnswer) : super(question , answer);

  @override
  void printQuestion(){
    print(question);
  }
}

void main(){

  var questionOne =  QuestionMultiple(
      'All are valid in Dart except for',
      4,
      ["bool", "int", "double", "char", "String"]);

  var questionTwo = FillInBlankQuestion(
      'A mans bestfriend is a ___',
      'dog',
      []);

  List<Question> t = <Question> [];
  var quiz = [];
  var userChoices = [];
  var finalScore = 0;
  quiz.add(questionOne);
  quiz.add(questionTwo);

  print('Welcome to my Quiz answer below !!\n');

  for (int i=0; i<quiz.length; i++) {
    if (quiz[i] is QuestionMultiple) {
      quiz[i].printQuestion();
      quiz[i].printAnswerChoices();
      print('Enter your answer (1-5)');
      while(true) {
        try {
          int userAnswer = int.parse(stdin.readLineSync()!);
          if (userAnswer >= 1 && userAnswer <= 5) {
            userChoices.add(userAnswer);
            break;
          }
          throw FormatException("Invalid response try again....");
        } catch(e){
          print("Answer is not in range");
        }

        //userChoices.add(userAnswer);
      }
    }
    else {
      quiz[i].printQuestion();
      stdout.write('\nEnter your answer');
      var answer = stdin.readLineSync();
      userChoices.add(answer);
    }

    if (userChoices[i] == quiz[i].answer) {
      finalScore ++;
    }

  }
  //hardcoded for now 
  print('\nQuiz done you scored $finalScore out of 2');
}