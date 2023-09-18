import 'package:app02/data/questions.dart';
import 'package:app02/question.dart';
import 'package:app02/result.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Result(selectedAnswers, restart);
      });
    }
  }

  void restart() {
    
    setState(() {
      activeScreen = Home(switchScreen);
      selectedAnswers = [];
    });
    
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Question(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF9800),
                Color(0xFFE91E63),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
