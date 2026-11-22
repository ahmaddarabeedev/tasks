import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:listapp/main.dart';

void main() {
  testWidgets('shows tasks, toggles completion, and navigates', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('My Tasks'), findsOneWidget);
    expect(find.text('Completed: 2 / 4'), findsOneWidget);
    expect(find.text('Buy groceries'), findsOneWidget);

    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();
    expect(find.text('Completed: 3 / 4'), findsOneWidget);

    await tester.tap(find.text('View Completed Tasks'));
    await tester.pumpAndSettle();

    expect(find.text('Completed Tasks'), findsOneWidget);
    expect(find.text('Buy groceries'), findsOneWidget);
    expect(find.text('Call mom'), findsNothing);

    await tester.tap(find.text('Back to Tasks'));
    await tester.pumpAndSettle();
    expect(find.text('Completed: 3 / 4'), findsOneWidget);
  });
}