void main() {
  testWidgets('drag 2', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();
    await tester.drag(find.byKey(Key('2')), Offset(500.0, 0.0));
    await tester.pumpAndSettle();
    
    expect(find.text('2'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
  
  testWidgets('drag 99', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      find.byKey(Key('99')),
      500.0,
      scrollable: find.byType(Scrollable),
    );
    
    await tester.drag(find.byKey(Key('99')), Offset(500.0, 0.0));
    await tester.pumpAndSettle();

    // Verify that the item contains the correct text.
    expect(find.text('99'), findsNothing);
    expect(find.text('98'), findsOneWidget);
  });
}
