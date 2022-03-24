class Quiz {
  late String title;
  List<String>? candidates;
  int? answer;

  Quiz({required this.title, this.candidates, this.answer});

  Quiz.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        candidates = map['candidates'],
        answer = map['answer'];
}
