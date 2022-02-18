void main() {
  int testNum = 0;
  testWidgets('drag 2', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.drag(find.byKey(Key('2')), Offset(500.0, 0.0));
    await tester.pumpAndSettle();
    
    // expect(find.text('2'), findsNothing);
    // expect(find.text('1'), findsOneWidget);

    final list2Finder = find.text('2').toString();
    final list1Finder = find.text('1').toString();
    if (list2Finder != 'zero widgets with text "2" (ignoring offstage widgets)') {
      print('Test Failed');
      _result(false, ['2 is dragged and not deleted.']);
    } else {
      testNum ++;
    }
    if (list1Finder != 'exactly one widget with text "1" (ignoring offstage widgets): Text("1", dependencies: [DefaultTextStyle, MediaQuery])') {
      print('Test Failed');
      _result(false, ['There is no 1, or more than two']);
    } else {
      testNum ++;
    }
    // print('${list2Finder}z');
    // print('${list1Finder}z');
  });
  
  testWidgets('drag 99', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      find.byKey(Key('99')),
      500.0,
      scrollable: find.byType(Scrollable),
    );
    
    await tester.drag(find.byKey(Key('97')), Offset(500.0, 0.0));
    await tester.pumpAndSettle();

    // Verify that the item contains the correct text.
    // expect(find.text('99'), findsNothing);
    // expect(find.text('98'), findsOneWidget);

    final list99Finder = find.text('99').toString();
    final list98Finder = find.text('98').toString();
    
    if (list99Finder != 'zero widgets with text "99" (ignoring offstage widgets)') {
      print('Test Failed');
      _result(false, ['2 is dragged and not deleted.']);
    } else {
      testNum ++;
    }
    if (list98Finder != 'exactly one widget with text "98" (ignoring offstage widgets): Text("98", dependencies: [DefaultTextStyle, MediaQuery])') {
      print('Test Failed');
      _result(false, ['There is no 1, or more than two']);
    } else {
      testNum ++;
    }
    // print('${list99Finder}z');
    // print('${list98Finder}z');
  });
  
  tearDown(() async {
    if (testNum == 4) {
      _result(true);
    }
  });
}
