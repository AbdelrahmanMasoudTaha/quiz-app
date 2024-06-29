import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/result.dart';

import 'home.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
   List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {

    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {

      setState(() {
        activeScreen =  ResultScreen(selectedAnswers);

      });
      selectedAnswers=[];
    }
    log(selectedAnswers.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    activeScreen = Home(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            // begin: Alignment.topRight,
            // end: Alignment.bottomLeft,
            colors: [Color(0xff69ACFF), Color(0xf0C06EFF)],
          )),
          child: activeScreen,
        ),
      ),
    );
  }
}
