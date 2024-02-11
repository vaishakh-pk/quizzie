import 'package:flutter/material.dart';
import 'package:quizzie/styles/answer_button.dart';
import 'package:quizzie/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  //Accessing objects from questions.
  var currentQuestionIndex = 0;
  answerQuestion()
  {
    setState(() 
    {
      currentQuestionIndex+=1;
    });
    
  }
  

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          // Spreading the list of answer buttons created using map to
          //individual widgets using "..." operator (Spread operator)
          ...currentQuestion.getShuffledAnswers().map((answer){
            return AnswerButton(answerText:answer,onTap: answerQuestion);
          }),
          
        ]),
      ),
    ));
  }
}
