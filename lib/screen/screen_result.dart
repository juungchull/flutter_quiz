import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/model_quiz.dart';

class ResultScreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizs;
  ResultScreen({required this.answers, required this.quizs});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for (int i = 0; i < quizs.length; i++) {
      if (quizs[i].answer == answers[i]) {
        score += 1;
      }
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Quiz APP'),
        backgroundColor: Colors.deepPurple,
        leading: Container(),
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.deepPurple),
          color: Colors.deepPurple,
        ),
        width: width * 0.85,
        height: height * 0.65,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: width * 0.048)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.deepPurple),
                color: Colors.white,
              ),
              width: width * 0.73,
              height: height * 0.25,
            )
          ],
        ),
      )),
    ));
  }
}
