import 'package:flutter/material.dart';

class Startpage extends StatelessWidget {
  Startpage(this.startQuiz,{super.key});

  void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.center;
    CrossAxisAlignment.center;
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.quiz,
          color: Color.fromARGB(108, 255, 255, 255),
          size: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height:30),
        ElevatedButton.icon(onPressed: startQuiz ,icon: const Icon(Icons.arrow_right_alt), label: const Text('Start Quiz'))
      ]),
    )));
  }
}