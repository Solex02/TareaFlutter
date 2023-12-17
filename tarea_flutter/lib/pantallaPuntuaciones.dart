import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key, required this.title, required this.score});
  final String title;
  final int score;
  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int get score => score;
  final testMap = {"Gonzalo": 1000, "Pedro": 200};
  final TextEditingController nameController = TextEditingController();

  void guardar() {
    print(nameController.text + score.toString());
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return MaterialApp(
      title: "Demo",
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Puntuaciones"),
            backgroundColor: Color.fromARGB(255, 255, 90, 82),
          ),
          body: Column(
            children: [
              Text("Tu puntuacion: $score"),
              ListView(
                children: const [Text("Prueba"), Text("Prueba")],
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Nombre',
                              ),
                              controller: nameController,
                            ),
                            Text("Puntuacion Final: $score")
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => guardar,
                            child: Text("Guardar"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancelar"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Guardar"))
            ],
          )),
    );
  }
}
