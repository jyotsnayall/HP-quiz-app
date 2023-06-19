// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String? questionText;

  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/scroll.png',
        ),
        Container(
          padding: const EdgeInsets.all(25),
          width: double.infinity,
          child: Text(
            questionText!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              fontFamily: 'Magik',
              color: Color.fromARGB(255, 72, 60, 22),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
