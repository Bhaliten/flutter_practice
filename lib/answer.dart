import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final VoidCallback answerCallback;

  const Answer({
    Key? key,
    required this.answer,
    required this.answerCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: answerCallback,
          child: Text(
            answer,
          ),
        ),
      ],
    );
  }
}
