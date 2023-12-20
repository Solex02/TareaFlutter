import 'package:flutter/material.dart';
import 'package:tarea_flutter/pantallaPrincipal.dart';
import 'package:tarea_flutter/pantallaPuntuaciones.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key, required this.title});
  final String title;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void gotoPantallaPrincipal() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const HomePage(
                title: '',
              )),
    );
  }

  void gotoPantallaPuntuaciones() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ScorePage(
                title: '',
                score: 0,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return MaterialApp(
      title: "Demo",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: gotoPantallaPrincipal,
                child: const Text('Jugar'),
              ),
              ElevatedButton(
                onPressed: gotoPantallaPuntuaciones,
                child: const Text('Puntuaciones'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
