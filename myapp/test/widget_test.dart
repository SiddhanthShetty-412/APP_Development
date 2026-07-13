import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/home_screen.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('login screen renders and navigates to register screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login Screen'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text("Don't have an account? Register"), findsOneWidget);

    await tester.tap(find.text("Don't have an account? Register"));
    await tester.pumpAndSettle();

    expect(find.text('Register Screen'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
  });

  testWidgets('home screen shows the Firestore entry form fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Mobile Number'), findsOneWidget);
  });
}
