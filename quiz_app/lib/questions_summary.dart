//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        data['user_answer'] == data['correct_answer']
                            ? Colors.blue
                            : Colors.pink,
                    maxRadius: 18,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color: data['user_answer'] == data['correct_answer']
                                ? Colors.blue
                                : Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
