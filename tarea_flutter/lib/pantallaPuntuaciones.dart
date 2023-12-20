import 'package:flutter/material.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';

// Get a reference your Supabase client
//final supabase = Supabase.instance.client;

class ScorePage extends StatefulWidget {
  const ScorePage({super.key, required this.title, required this.score});
  final String title;
  final int score;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

var puntuaciones = [];

class _ScorePageState extends State<ScorePage> {
  final testMap = {"Gonzalo": 1000, "Pedro": 200};
  final TextEditingController nameController = TextEditingController();
  var data;
  get score => null;

  @override
  void initState() {
    super.initState();

    //getpuntuaciones();
  }

  // Resto del código...

  /*Future<void> getpuntuaciones() async {
    data = await supabase.from('puntuaciones').select('nombre, puntos');
    print(data);

    setState(() {
      puntuaciones =
          data; // Actualizar el estado con las puntuaciones obtenidas
    });
  }

  Future<void> savepuntuaciones() async {
    final response = await supabase.from('puntuaciones').upsert([
      {'nombre': "prueba", 'puntos': 2}
    ]);

    print(response);
  }
*/

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
    return Scaffold(
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
              scrollDirection: Axis.vertical,
              itemCount: puntuaciones.length,
              itemBuilder: (BuildContext ctxt, int index) {
                // Construir un widget con los datos de 'data'
                return Center(
                  child: Text(
                    '${data[index]['nombre']}: ${data[index]['puntos']}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => testAlert(context),
            child: Text("Guardar"),
          ),
        ],
      ),
    );
  }

  void testAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nombre',
              ),
              // Aquí debes tener un TextEditingController definido
              // Ejemplo: controller: nameController,
            ),
            // Asegúrate de tener definida la variable `score`
            Text("Puntuación Final: $score"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              guardar();
              Navigator.pop(context);
            },
            child: Text("Guardar"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
        ],
      ),
    );
  }
}
