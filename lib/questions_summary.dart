import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
            summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: data['user_answer']== data['correct_answer']?  const Color.fromARGB(255, 51, 213, 250) : const Color.fromARGB(255, 239, 138, 217)) ,
                    child: Text(((data['question_index'] as int) +1).toString(),
                    style: GoogleFonts.lato(
                      color: Colors.black
                    ),
                    textAlign: TextAlign.center,
                    )),
                    const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(data['question'] as String,
                      style: GoogleFonts.lato(
                        color: Color.fromARGB(255, 240, 199, 247),
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 5,),
                      Text(data['user_answer'] as String,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 198, 109, 218),
                        fontSize: 14
                      ),),
                      // SizedBox(height: 5,),
                      Text(data['correct_answer'] as String,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 113, 197, 236),
                        fontSize: 14
                      ),)
                    ],),
                  )
                ],
              );
            }).toList(),
        ),
      ),
    );
  }
}
