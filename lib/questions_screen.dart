import 'package:flutter/material.dart';
import 'package:quizzie/styles/answer_button.dart';
import 'package:quizzie/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  final currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
         Text(
          currentQuestion.text,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        AnswerButton(answerText:currentQuestion.answers[0],onTap: (){})
      ]),
    ));
  }
}
