import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(153, 48, 1, 64),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.lato(
              color: Color.fromARGB(158, 237, 198, 244), fontSize: 28),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 48, 1, 64),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ))
      ],
    ));
  }
}
