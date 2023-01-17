import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final VoidCallback resetCallback;

  const Result({Key? key, required this.result, required this.resetCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Your score:',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            result.toString(),
            style: TextStyle(
              fontSize: 32,
              color: Colors.blue,
            ),
          ),
          TextButton(
            onPressed: resetCallback,
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }
}
