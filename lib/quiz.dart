import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final VoidCallback answerQuestion;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        // We are transforming every answer into an Answer widget, convert them into a list and then add them to the children list.
        // By using the ... we are expanding the list below, such that the elements inside the list(Answer widgets) will be added to the children list,
        // instead of adding a list inside the list
        // it will be like...
        // Answer(_answerQuestion, answer),
        // Answer(_answerQuestion, answer),
        // Answer(_answerQuestion, answer),
        // ...
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList(),
      ],
    );
  }
}
