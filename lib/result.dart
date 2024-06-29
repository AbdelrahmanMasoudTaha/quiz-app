import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.selectedAnswers, {
    super.key,
  });

  final List<String> selectedAnswers;

// List<Map<String, Object>>
  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];
    for (int i = 0; i < questions.length; i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].question,
        'answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered 3 out of 6 Questions ',
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...getSummeryData().map((e) {
              return Column(
                children: [
                  Text(
                    e['question_index'].toString(),
                  ),
                  Text(
                    e['question'].toString(),
                  ),
                  Text(
                    e['answer'].toString(),
                  ),
                  Text(
                    e['user_answer'].toString(),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xa0530191),
                ),
              ),
            )
          ],
        ));
  }
}
