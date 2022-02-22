import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drag App',
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list = List.generate(100, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(list[index]),
          onDismissed: (event) {
            setState(() {
              list.removeAt(index);
            });
          },
          child: ListTile(title: Center(child: Text(list[index].toString()))),
          background: Container(
            color: Colors.amber,
          ),
        );
      },
      itemCount: list.length,
    );
  }
}
