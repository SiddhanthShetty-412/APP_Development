import 'dart:io';

import 'package:smart_quiz_app/quiz_app.dart';
import 'package:test/test.dart';

void main() {
  group('QuizApp', () {
    late Directory tempDir;
    late String questionsPath;
    late String scorePath;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('smart_quiz_app_test');
      questionsPath = '${tempDir.path}/questions.json';
      scorePath = '${tempDir.path}/score.txt';
      await File(questionsPath).writeAsString(r'''[
        {"id": 1, "text": "Question 1", "options": ["A", "B"], "answerIndex": 0}
      ]''');
    });

    tearDown(() async {
      await tempDir.delete(recursive: true);
    });

    test('loads questions from JSON', () async {
      final app = QuizApp(questionsPath: questionsPath, scorePath: scorePath);
      final questions = await app.loadQuestions();
      expect(questions, hasLength(1));
      expect(questions.first.text, 'Question 1');
    });

    test('saves and loads score', () async {
      final app = QuizApp(questionsPath: questionsPath, scorePath: scorePath);
      await app.saveScore(3);
      expect(await app.loadScore(), 3);
    });
  });
}
