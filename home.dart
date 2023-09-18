import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz.png',
            width: 150,
          ),
          const SizedBox(height: 40),
          Text(
            'Learn Flutter!',
            style: GoogleFonts.lato(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
