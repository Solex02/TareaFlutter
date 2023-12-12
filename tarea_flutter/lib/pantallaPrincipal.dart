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
  var images_list = [
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
  }

  void _nextImage(int value) {
    setState(() {
      image = images_list[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      appBar: AppBar(
        title: Text("Image from assets"),
      ),
      body: Center(
          // Enabling the Image Frame
          child: Container(
              color: Colors
                  .indigo, // To see the difference between the image's original size and the frame
              height: 250,
              width: 250,

              // Uploading the Image from Assets
              child: Image.asset(
                'assets/images/' + image,
                fit: BoxFit.cover,
              ))),

      floatingActionButton: FloatingActionButton(
        onPressed: prueba,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
