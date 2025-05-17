import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_Screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionsScreen(
        onSelectectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(selectedAnswers, restartQuiz);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 109, 5, 128),
                Color.fromARGB(255, 178, 30, 205),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          // child: activeScreen == 'start_screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
