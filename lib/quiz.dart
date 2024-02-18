import 'package:flutter/material.dart';
import 'package:quizzie/data/questions.dart';
import 'package:quizzie/questions_screen.dart';
import 'package:quizzie/results.dart';
import 'package:quizzie/start.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  @override
  void switchScreen()
  {
    setState(() {
      activeScreen = 'quiz-screen';
      selectedAnswers.clear();
    });
  }

  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length)
    {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Startpage(switchScreen);
    if(activeScreen == 'quiz-screen')
    {
      screenWidget = QuestionsScreen(chooseAnswer);
    }
    else if(activeScreen == 'result-screen')
    {
      screenWidget = resultsScreen(switchScreen,selectedAnswers);
    }
    return MaterialApp(
      title: 'Quizzie',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(background: Colors.deepPurple)),
      home: screenWidget,
    );
  }
}