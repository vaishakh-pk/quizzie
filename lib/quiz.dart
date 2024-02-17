import 'package:flutter/material.dart';
import 'package:quizzie/questions_screen.dart';
import 'package:quizzie/start.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = Startpage(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
  }

  void switchScreen()
  {
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzie',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(background: Colors.deepPurple)),
      home: activeScreen,
    );
  }
}