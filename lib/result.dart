import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.selectedAnswers, {
    super.key, required this.restart,
  });

  final List<String> selectedAnswers;
  final Function() restart;
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
    final summeryData = getSummeryData();
    int numOfCorrectAnswers = summeryData.where((e) {
      return e['user_answer'] == e['answer'];
    }).length;

    return Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numOfCorrectAnswers out of ${questions.length} Questions ',
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
            Summery(summeryData: summeryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restart,
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffcabff1),
                ),
              ),
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Color(0xffcabff1),
              ),
            )
          ],
        ));
  }
}
