import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              ),
            Container(
              width: 150,
              height: 150,
              color: Colors.amber,
              child: const Icon(
                Icons.person,
                size: 150,
                color: Colors.white
                ),
            ),
            const SizedBox(
              height: 10,
              ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.greenAccent,
              height: 30,
              alignment: Alignment.center,
              child: const Row(
                children: [
                  Expanded(flex: 2, child: Text("Informe seu email:")),
                  Expanded(flex: 3, child: Text("Email")),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.greenAccent,
              height: 30,
              alignment: Alignment.center,
              child: const Row(
                children: [
                  Expanded(flex: 2, child: Text("Informe a senha:")),
                  Expanded(flex: 3, child: Text("Senha")),
                ],
              ),
            ),
                        const SizedBox(
              height: 30,
            ),
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.greenAccent,
              height: 30,
              alignment: Alignment.center,
              child: const Text("Botao de login"),
            ),
            const SizedBox(
              height: 30,
            ),
                        Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Colors.greenAccent,
              height: 30,
              alignment: Alignment.center,
              child: const Text("Cadastro"),
            ),
          ],
        ),
      ),
    );
  }
}