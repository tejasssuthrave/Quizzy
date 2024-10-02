import 'package:flutter/material.dart';
import 'package:quizapp/question_model.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              const Text(
                "Simple Quiz App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              _questionWidget(),
              _answerList(),
            ],
          )),
    );
  }
}

_questionWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Question ${currentQuestionIndex + 1}/5{questionList.length.toString()}",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 20),
      Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          questionList[currentQuestionIndex].questionText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      )
    ],
  );
}

_answerList() {
  return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList);
}

Widget _answerButton(Answer answer) {
  bool isSelected = answer==selectedAnswer;
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 8),
    height: 48,
    child: ElevatedButton(
      child: Text(answer.answerText),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: isSelected?Colors.orangeAccent:Colors.white,
        foregroundColor: isSelected?Colors.white:Colors.black,
      ),
      onPressed: () {
        if(selectedAnswer == null){
          if(answer.isCorrect){
            score++;
          }
        }
        setState(
            (){
              selectedAnswer = answer;
            }
        );
      },
    ),
  );`
}

[]
