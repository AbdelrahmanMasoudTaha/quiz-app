import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
   const Questions(this.onSelectedAnswer,{super.key});
  final void Function(String) onSelectedAnswer;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  var questionIndex = 0;
void  answerQuestion(String answer){

  setState(() {
    widget.onSelectedAnswer(answer);
    questionIndex++;
  });
}


  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Container(
        margin: const EdgeInsets.all(10),
    child: Column(
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
             return  Container(
                     margin :const EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,
                     child: AnswerButton(answerText: e, onPress:()=> answerQuestion(e)));

            }
        ),


      ],
    ));
  }
}
