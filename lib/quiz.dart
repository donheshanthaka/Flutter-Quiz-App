import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
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
          questions[questionIndex]['questionText'] as String,
        ),
        // We are transforming every answer into an Answer widget, convert them into a list and then add them to the children list.
        // By using the ... we are expanding the list below, such that the elements inside the list(Answer widgets) will be added to the children list,
        // instead of adding a list inside the list
        // it will be like...
        // Answer(_answerQuestion, answer),
        // Answer(_answerQuestion, answer),
        // Answer(_answerQuestion, answer),
        // ...
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          // answerQuestion is passed as an annonymous function, therefore it is created on the run since inside Answer object and the address is passed,
          // answerquestion is being used as an argument for the onpressed function which doesn't take functions with arguments
          // In simple terms, an annonymous function is created and its address is passed on, and when the button is pressed then, the function will be executed (the function body "(answer['score'])" is only executed when the button is pressed)
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
