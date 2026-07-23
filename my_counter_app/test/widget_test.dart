import 'package:flutter_test/flutter_test.dart';

import 'package:my_counter_app/main.dart';

void main() {
  testWidgets('quiz app shows questions and advances', (tester) async {
    await tester.pumpWidget(const QuizApp());

    expect(find.text('Smart Quiz App'), findsOneWidget);
    expect(find.text('What does OOP stand for?'), findsOneWidget);

    await tester.tap(find.text('Object-Oriented Programming'));
    await tester.pump();
    await tester.tap(find.text('Next'));
    await tester.pump();

    expect(find.text('Which keyword is used to create a class in Dart?'), findsOneWidget);
  });
}
