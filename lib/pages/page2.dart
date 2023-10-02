import 'package:flutter/material.dart';

class Pagina2Page extends StatefulWidget {
  const Pagina2Page({super.key});

  @override
  State<Pagina2Page> createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  TextEditingController peso = TextEditingController(text: "");
  TextEditingController altura = TextEditingController(text: "");
  var imc = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        TextField(
          controller: peso,
          decoration: const InputDecoration(
            hintText: "Peso",
          ),
        ),
        TextField(
          controller: altura,
          decoration: const InputDecoration(
            hintText: "Altura",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              imc = int.parse(peso.text) ~/ ((int.parse(altura.text) * 2) / 100);
            });
          },
          child: const Text("Calcular"),
        ),
        Text(
          "Seu IMC é: $imc",
        ),
      ],
    );
  }
}
