import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key, required this.title});
  final String title;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return MaterialApp(
      title: "Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Puntuaciones"),
          backgroundColor: Color.fromARGB(255, 255, 90, 82),
        ),
        body: ListView(
          children: const [
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
