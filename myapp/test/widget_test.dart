import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';

void main() {
  testWidgets('login screen renders and navigates to register screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login Screen'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text("Don't have an account? Register"), findsOneWidget);

    await tester.tap(find.text("Don't have an account? Register"));
    await tester.pumpAndSettle();

    expect(find.text('Register Screen'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
  });
}
