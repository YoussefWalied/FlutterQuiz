import 'package:app02/data/questions.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
    this.selectedAnswer,
    this.restart ,
    {super.key}
    );

  final List<String> selectedAnswer;

  final void Function()restart; 

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add({
        'Question_index': i,
        'Question': questions[i].text,
        'Correct_Answer': questions[i].answers[0],
        'User_Answer': selectedAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = summaryData;
    var numOfCorrectAnswers = summary
        .where((element) => element['User_Answer'] == element['Correct_Answer'])
        .length;
    return Container(
      margin: const EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            ('You answered $numOfCorrectAnswers out of ${questions.length} questions correctly!'),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 350,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...summaryData.map(
                    (e) => Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor:
                                  e['User_Answer'] == e['Correct_Answer']
                                      ? Colors.green
                                      : const Color.fromARGB(255, 240, 8, 42),
                              child: Text(
                                ((e['Question_index'] as int) + 1).toString(),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e['Question'].toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    e['User_Answer'].toString(),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 71, 66, 66),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    e['Correct_Answer'].toString(),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 15, 113, 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 13),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          TextButton.icon(
            onPressed: restart,
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Colors.black,
            ),
            label: const Text(
              'Restart Quiz!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
 