import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
   Home(this.switchScreen,{super.key});
 void Function() switchScreen;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          height: 80,
        ),
         Text(
          'Learn Flutter',
          style: GoogleFonts.aBeeZee(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_forward,color: Colors.white,),
            label: const Text('Start Quiz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
             )
      ],
    );
  }
}
