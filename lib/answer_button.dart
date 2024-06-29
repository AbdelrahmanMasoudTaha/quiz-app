
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onPress});

  final String answerText;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xa0530191),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      ),
      child: Text(answerText,textAlign: TextAlign.center),
    );
  }
}
