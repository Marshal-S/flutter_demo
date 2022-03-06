import 'package:flutter/material.dart';
import 'demo/hello_world.dart';
import 'demo/list_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterDemo",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text('hello word!'),
        ),
        // body: const MyWidge()
        // body: const ContainerView(),
        // body: const RichTextView(),
        body: const CarListView()
      )
    );
  }
}