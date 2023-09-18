import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onPressed});

  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFFFF9800),
          backgroundColor: Colors.grey[800],
          padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 35),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
