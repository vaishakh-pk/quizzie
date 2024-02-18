import 'package:flutter/material.dart';

class resultsScreen extends StatelessWidget {
  const resultsScreen(this.switchScreen,this.chooseAnswers,{super.key});

  final void Function() switchScreen;
  final List<String> chooseAnswers;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered 10 out of 10'),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: const Text(
                      '1',
                      textAlign: TextAlign.center,
                    ),
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red)),
                const Column(
                  children: [
                    Text('What is the UI of fluttter'),
                    Text('widget'),
                    Text('Wrong answer'),
                  ],
                )
              ],
            ),
            TextButton(onPressed: switchScreen, child: const Text('Restart Quiz',style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    )));
  }
}
