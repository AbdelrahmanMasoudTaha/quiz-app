import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final currentQuestion = questions[1];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
           Text(
            currentQuestion.question,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        const SizedBox(
          height: 40,
        ),
        ...currentQuestion.getShuffledAnswers().map(
            (String e){
             return Container(
               margin: EdgeInsets.all(10),
                 child: AnswerButton(answerText: e, onPress: (){})
             );
            }
        ),


      ],
    );
  }
}
