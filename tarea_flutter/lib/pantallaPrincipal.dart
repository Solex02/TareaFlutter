import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  var images_list = ["gatos.png", "perro.jpg"];
  var duration = const Duration(seconds: 2);
  void _nextImage() {
    setState(() {

      for (var i = 0; i < images_list.length; i++) {
        _counter = i;
        sleep(duration);
        print(_counter);
      }
      _counter = 0;

      
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
                color: Colors.indigo, // To see the difference between the image's original size and the frame
                height: 250,
                width: 250,

                // Uploading the Image from Assets
                child: Image.asset(
                  'assets/images/'+images_list[_counter],

                  // Resizing the Image to the Frame Size
                  fit: BoxFit.cover,
                ))),
        
          floatingActionButton: FloatingActionButton(
        onPressed: _nextImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
