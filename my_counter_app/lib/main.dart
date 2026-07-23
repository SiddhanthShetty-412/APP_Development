import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final List<_QuizQuestion> _questions = const [
    _QuizQuestion(
      question: 'What does OOP stand for?',
      options: ['Object-Oriented Programming', 'Ordered Output Process', 'Optimized Object Parsing'],
      answerIndex: 0,
    ),
    _QuizQuestion(
      question: 'Which keyword is used to create a class in Dart?',
      options: ['struct', 'class', 'interface'],
      answerIndex: 1,
    ),
    _QuizQuestion(
      question: 'What does async/await help with?',
      options: ['Synchronous code only', 'Asynchronous operations', 'Static typing'],
      answerIndex: 1,
    ),
  ];

  int _currentIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _showResult = false;

  void _selectAnswer(int answerIndex) {
    setState(() {
      _selectedAnswerIndex = answerIndex;
    });
  }

  void _nextQuestion() {
    final currentQuestion = _questions[_currentIndex];
    if (_selectedAnswerIndex == currentQuestion.answerIndex) {
      _score++;
    }

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswerIndex = null;
      });
    } else {
      setState(() {
        _showResult = true;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _selectedAnswerIndex = null;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Smart Quiz App')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Quiz Completed!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text('Your score: $_score/${_questions.length}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 24),
                ElevatedButton(onPressed: _resetQuiz, child: const Text('Try Again')),
              ],
            ),
          ),
        ),
      );
    }

    final currentQuestion = _questions[_currentIndex];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Smart Quiz App')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${_currentIndex + 1}/${_questions.length}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              Text(
                currentQuestion.question,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ...currentQuestion.options.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;
                final selected = _selectedAnswerIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => _selectAnswer(index),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: selected ? Colors.blue : Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(option),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _selectedAnswerIndex == null ? null : _nextQuestion,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuizQuestion {
  const _QuizQuestion({required this.question, required this.options, required this.answerIndex});

  final String question;
  final List<String> options;
  final int answerIndex;
}
