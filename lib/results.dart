import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzie/data/questions.dart';
import 'package:quizzie/questions_summary.dart';

class resultsScreen extends StatelessWidget {
  const resultsScreen(this.switchScreen, this.choosenAnswers, {super.key});

  final void Function() switchScreen;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions correctly!',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
                icon: const Icon(Icons.restart_alt, color: Colors.white,),
                onPressed: switchScreen,
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    )));
  }
}
