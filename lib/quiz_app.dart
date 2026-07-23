import 'dart:convert';
import 'dart:io';

class QuizQuestion {
  QuizQuestion({required this.id, required this.text, required this.options, required this.answerIndex});

  final int id;
  final String text;
  final List<String> options;
  final int answerIndex;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'] as int,
      text: json['text'] as String,
      options: List<String>.from(json['options'] as List),
      answerIndex: json['answerIndex'] as int,
    );
  }
}

class QuizApp {
  QuizApp({required this.questionsPath, required this.scorePath});

  final String questionsPath;
  final String scorePath;

  Future<List<QuizQuestion>> loadQuestions() async {
    final file = File(questionsPath);
    if (!await file.exists()) {
      throw FileSystemException('Questions file not found', questionsPath);
    }

    final content = await file.readAsString();
    final decoded = jsonDecode(content) as List;
    return decoded.map((entry) => QuizQuestion.fromJson(entry as Map<String, dynamic>)).toList();
  }

  Future<int> loadScore() async {
    final file = File(scorePath);
    if (!await file.exists()) {
      return 0;
    }
    final content = await file.readAsString();
    return int.tryParse(content.trim()) ?? 0;
  }

  Future<void> saveScore(int score) async {
    final file = File(scorePath);
    await file.parent.create(recursive: true);
    await file.writeAsString(score.toString());
  }

  Future<int> run() async {
    final questions = await loadQuestions();
    var score = await loadScore();

    stdout.writeln('Smart Quiz App');
    stdout.writeln('================');
    stdout.writeln('Previous score: $score');
    stdout.writeln('');

    for (final question in questions) {
      stdout.writeln('Q${question.id}: ${question.text}');
      for (var index = 0; index < question.options.length; index++) {
        stdout.writeln('  ${index + 1}. ${question.options[index]}');
      }

      stdout.write('Choose an option (1-${question.options.length}): ');
      final input = stdin.readLineSync();
      final selectedIndex = int.tryParse(input ?? '') ?? 0;

      if (selectedIndex > 0 && selectedIndex - 1 == question.answerIndex) {
        score++;
        stdout.writeln('Correct!');
      } else {
        stdout.writeln('Wrong!');
      }
      stdout.writeln('');
    }

    await saveScore(score);
    stdout.writeln('Final score: $score/${questions.length}');
    return score;
  }
}
