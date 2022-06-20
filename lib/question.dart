import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // Using final keyword because it is a stateless widget and flutter needs to know that you cannot change the value in these variables after create an instance for the class
  // For the purpose of this class we won't be changing the value since an object of type Question is made for each and every question
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
