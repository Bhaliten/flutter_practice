import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  final TextStyle textStyle = const TextStyle(fontSize: 28);

  const Question({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        question,
        style: textStyle,
      ),
    );
  }
}
