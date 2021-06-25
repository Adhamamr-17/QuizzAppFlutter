import 'package:flutter/material.dart';
import 'main.dart';

class Question extends StatelessWidget {
  final String questiontext;

  Question(this.questiontext);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        questiontext,
        style: TextStyle(fontSize: 25, color: b),
        textAlign: TextAlign.center,
      ),
    );
  }
}
