import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( primarySwatch: Colors.amber ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var number = 0;

  int _randomNumberGenerate() {
    Random random = Random();
    return random.nextInt(1000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
      ),
      body: Center(
        child: Text("Numero gerado: $number"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number = _randomNumberGenerate();
          });
        },
        child: const Icon(Icons.ads_click),
      ),
    );
  }
}