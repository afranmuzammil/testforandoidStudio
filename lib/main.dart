import 'package:flutter/material.dart';
import 'package:webappflutter/Pages/question_answer.dart';

void main() {
  runApp(const IknowEverythingApp());
}

class IknowEverythingApp extends StatelessWidget {
  const IknowEverythingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "I know Everything",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const QustionAnswerPage(),
    );
  }
}

