import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': ['Max', 'Jane', 'Done', 'Mike'],
      },
    ];

  var _questionIndex = 0;

  void _answerQuestion() {

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < questions.length){
      print('we have more questions');
    } else {
      print('Out of questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length ? Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            // We are transforming every answer into an Answer widget, convert them into a list and then add them to the children list.
            // By using the ... we are expanding the list below, such that the elements inside the list(Answer widgets) will be added to the children list,
            // instead of adding a list inside the list
            // it will be like...
            // Answer(_answerQuestion, answer),
            // Answer(_answerQuestion, answer),
            // Answer(_answerQuestion, answer),
            // ...
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ) : Center(child: Text('You did it!'),),
      ),
    );
  }
}
