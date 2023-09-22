import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  final String texto;
  final List<String> dados;
  const Dados({super.key, required this.texto, this.dados = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(texto)),
      body: const Center(
        child: Text("Dados Cadastrais"),
      )
    );
  }
}