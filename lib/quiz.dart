import 'package:flutter/material.dart';
import 'package:flutter_practice/question.dart';
import 'package:flutter_practice/result.dart';

import 'answer.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _score = 0;
  int _questionIndex = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'Question 1?',
      'answers': [
        {
          'answer': 'Answer 1',
          'score': 1,
        },
        {
          'answer': 'Answer 2',
          'score': 2,
        },
        {
          'answer': 'Answer 3',
          'score': 3,
        },
      ],
    },
    {
      'question': 'Question 2?',
      'answers': [
        {
          'answer': 'Answer 1',
          'score': 1,
        },
        {
          'answer': 'Answer 2',
          'score': 2,
        },
        {
          'answer': 'Answer 3',
          'score': 3,
        },
      ],
    },
    {
      'question': 'Question 3?',
      'answers': [
        {
          'answer': 'Answer 1',
          'score': 1,
        },
        {
          'answer': 'Answer 2',
          'score': 2,
        },
        {
          'answer': 'Answer 3',
          'score': 3,
        },
      ],
    },
  ];

  void _incrementScore(int score) {
    _score += score;

    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  void _resetScore() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _questions.length > _questionIndex
        ? Column(
            children: <Widget>[
              Question(
                question: _questions[_questionIndex]['question'] as String,
              ),
              ...(_questions[_questionIndex]['answers'] as List).map(
                (answer) => Answer(
                  answer: answer['answer'] as String,
                  answerCallback: () => {
                    _incrementScore(answer['score']),
                  },
                ),
              ),
            ],
          )
        : Result(
            score: _score,
            resetCallback: _resetScore,
          );
  }
}
