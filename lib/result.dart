import 'package:flutter/material.dart';
import 'main.dart';
class Result extends StatelessWidget {
  final Function q;
  final resultScore;
  Result(this.q, this.resultScore);
  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = 'You are smart!';
    } else if (resultScore >= 40) {
      resultText = 'You are good!';
    } else {
      resultText = 'Not so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Score = $resultScore \n $resultPhrase",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: b),
            textAlign: TextAlign.center,
          ),
          IconButton(
            icon: Icon(Icons.restore),
            iconSize: 50,
            color: Colors.green,
            tooltip: 'Restart The App',
            onPressed: q,
          )
        ],
      ),
    );
  }
}
