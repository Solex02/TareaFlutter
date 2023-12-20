import 'package:flutter/material.dart';
import 'package:tarea_flutter/pantallaInicio.dart';
import 'package:tarea_flutter/pantallaPuntuaciones.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 235, 81, 60)),
        useMaterial3: true,
      ),
      home: const ScorePage(
        title: 'Flutter Demo Home Page',
        score: 2,
      ),
    );
  }
}
