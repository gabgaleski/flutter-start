import 'package:flutter/material.dart';

import '../service/gerar_numero.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var number = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My First App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(246, 0, 0, 0),
          )
          ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 189, 188, 224),
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Numero gerado:",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: Text(
                "$number",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number = GerarNumeroAleatorio.randomNumberGenerate(1000);
          });
        },
        child: const Icon(Icons.ads_click),
      ),
    );
  }
}