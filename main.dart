import 'dart:io';

import 'package:smart_quiz_app/quiz_app.dart';

Future<void> main() async {
  final questionsPath = File('assets/questions.json').absolute.path;
  final scorePath = File('assets/score.txt').absolute.path;

  final app = QuizApp(questionsPath: questionsPath, scorePath: scorePath);
  await app.run();
}
