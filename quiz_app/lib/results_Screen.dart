// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
//import 'package:quiz_app/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswers, this.reset, {super.key});

  final List<String> choosenAnswers;
  final void Function() reset;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correct',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(158, 237, 198, 244),
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: reset,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 48, 1, 64),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
