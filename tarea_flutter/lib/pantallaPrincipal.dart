import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String image = "blanco.jpg";
  List numlist = [];
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

  void prueba() async {
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Juego de memoria"),
      ),
      body: Card(
        // Enabling the Image Frame
        child: Container(
            color: Colors
                .indigo, // To see the difference between the image's original size and the frame
            height: 250,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/$image',
                  fit: BoxFit.cover,
                ),
                Container(
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: prueba,
                          child: Image.asset('assets/images/$imagesList[0]')),
                    ],
                  ),
                )
              ],
            )),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: prueba,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
