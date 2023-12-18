import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  print("main");
  await Supabase.initialize(
    url: 'https://cazcggegzdrzgqqfuete.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNhemNnZ2VnemRyemdxcWZ1ZXRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI5MjAyNDAsImV4cCI6MjAxODQ5NjI0MH0.wXim6D3gmVIPVaBWst-XMlN8jfYrauzqbteXuqFJQ9A',
  );

  runApp(ScorePage(title: '', score: 0,));

}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class ScorePage extends StatefulWidget {
  const ScorePage({super.key, required this.title, required this.score});
  final String title;
  final int score;

  @override
  State<ScorePage> createState() => _ScorePageState();
  
}

final products = ["hola", "Hola"];


class _ScorePageState extends State<ScorePage> {
  final testMap = {"Gonzalo": 1000, "Pedro": 200};
  final TextEditingController nameController = TextEditingController();

  get score => null;

  @override
  void initState() {
    super.initState();
    getpuntuaciones();
  }

  // Resto del código...

  void getpuntuaciones() async {
    print("get");
    //final response = await supabase.from('puntuaciones').select('*');
    print('Puntuaciones obtenidas: 2');
     
  }



  void guardar() {
    print("guardar");
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
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Text("list");
                  },
                ),
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
