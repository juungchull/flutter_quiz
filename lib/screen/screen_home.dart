import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/model_quiz.dart';
import 'package:flutter_quiz/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //퀴즈 더미 데이터 ---> 퀴즈 스크린으로 넘겨 줄 것임
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Quiz App'),
          backgroundColor: Colors.deepPurple,
          leading: Container(), //뒤로 가기 버튼을 자동으로 지워줌!!!
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/image/quiz.jpg',
                width: width * 0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              '플러터 퀴즈 앱',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '퀴즈를 풀기 전에 안내 사항입니다.\n꼼꼼히 읽고 퀴즈 풀기를 눌러 주세요',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
            _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤\n다음 문제 버튼을 눌러 주세요.'),
            _buildStep(width, '3. 만점을 향해 도전해보세요.'),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ElevatedButton(
                  child: const Text('지금 퀴즈 풀기'),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => QuizScreen(
                                quizs: quizs,
                              )),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 5),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildStep(double width, String title) {
  return Container(
    padding: EdgeInsets.fromLTRB(
      width * 0.048,
      width * 0.024,
      width * 0.048,
      width * 0.024,
    ),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(
        Icons.check_box,
        size: width * 0.04,
      ),
      Padding(
        padding: EdgeInsets.only(right: width * 0.024),
      ),
      Text(title),
    ]),
  );
}
