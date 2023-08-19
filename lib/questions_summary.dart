import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSumary extends StatelessWidget {
  const QuestionsSumary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: data['user_answer'] == data['correct_answer']
                          ? const Color.fromARGB(255, 0, 107, 45)
                          : const Color.fromARGB(255, 255, 0, 0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: data['user_answer'] == data['correct_answer']
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 21, 255, 0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 76, 175, 80),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
