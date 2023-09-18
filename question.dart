import 'package:app02/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:app02/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer, {super.key});

  final void Function(String) onSelectedAnswer;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.shuffledAnswers.map(
            (e) {
              return Container(
                margin: const EdgeInsets.all(7),
                child: AnswerButton(
                  answerText: e,
                  onPressed: () {
                    answerQuestion(e);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
