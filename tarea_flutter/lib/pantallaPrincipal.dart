import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tarea_flutter/CustomButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String image = "blanco.jpg";
  List numlist = [];
  int _puntuacion = 0;
  var secuenciaNum = [];
  var imagesList = [
    "gatos.png",
    "perro.jpg",
    "conejo.jpg",
    "sapo.jpg",
    "pato.jpg",
    "mapache.jpg"
  ];
  var duration = const Duration(seconds: 2);

  void imageCicle() async {
    int rnd = Random().nextInt(5);
    numlist.add(rnd);
    for (final value in numlist) {
      await Future.delayed(duration);
      _nextImage(value);
    }
    image = "blanco.jpg";
  }

  void _nextImage(int value) {
    setState(() {
      image = imagesList[value];
    });
  }

  void checkImage(String word) {
    print(word);
  }

  @override
  void initState() {
    super.initState();
    imageCicle(); //call it over here
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return MaterialApp(
      title: "Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Puntuacion: $_puntuacion"),
          backgroundColor: Color.fromARGB(255, 255, 90, 82),
        ),
        body: Center(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/gatos.png', // Reemplaza con la ruta de tu imagen
                  width:
                      400, // Ajusta el tamaño de la imagen según lo necesario
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 600, // Ajusta el tamaño de la imagen según lo necesario
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio:
                      2.0, // Ajusta la relación de aspecto de los botones
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 4.0,
                  children: [
                    CustomButton(
                        icon: "assets/images/${imagesList[0]}",
                        onPressed: () => checkImage(imagesList[0])),
                    CustomButton(
                        icon: "assets/images/${imagesList[1]}",
                        onPressed: () => checkImage(imagesList[1])),
                    CustomButton(
                        icon: "assets/images/${imagesList[2]}",
                        onPressed: () => checkImage(imagesList[2])),
                    CustomButton(
                        icon: "assets/images/${imagesList[3]}",
                        onPressed: () => checkImage(imagesList[3])),
                    CustomButton(
                        icon: "assets/images/${imagesList[4]}",
                        onPressed: () => checkImage(imagesList[4])),
                    CustomButton(
                        icon: "assets/images/${imagesList[5]}",
                        onPressed: () => checkImage(imagesList[5])),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
