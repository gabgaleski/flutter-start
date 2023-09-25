import 'package:firstapp/repositories/linguagens_repository.dart';
import 'package:firstapp/repositories/nivel_repository.dart';
import 'package:flutter/material.dart';

class Dados extends StatefulWidget {

   const Dados({Key? key, }) : super(key: key);

  @override
  State<Dados> createState() => _DadosState();
}

class _DadosState extends State<Dados> {
    var nomeController = TextEditingController(text: "");
    var dataNascimentoController = TextEditingController(text: "");
    DateTime? dataNascimento;
    var nivelRepository = NivelRepository();
    var linguagensRepository = LinguagensRepository();
    var niveis = [];
    var nivelSelecionado = "";
    var linguagensSelecionadas = [];
    var linguagens = [];
    double salarioEscolhido = 0;
    int tempoDeExperiencia = 0;

    bool salvando = false;


    Text returnText (String text) {
    return Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700));
    }

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> validate (text){
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    }

    List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
      var itens = <DropdownMenuItem>[];
      for (var i = 0; i < quantidadeMaxima; i++) {
        itens.add(DropdownMenuItem(child: Text(i.toString()), value: i,));
      }
      return itens;
    }

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dados Cadastrais")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: salvando ? const Center(child: CircularProgressIndicator()) : ListView(
          children: [
            returnText("Nome"),
            TextField(
              controller: nomeController,
            ),
            const SizedBox(height: 20,),
            returnText("Data de nascimento"),
            TextField(
              readOnly: true,
              controller: dataNascimentoController,
              onTap: () async {
                var data = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(1900), 
                  lastDate: DateTime.now(),
                );
                if (data != null) {
                  dataNascimentoController.text = data.toString();
                  dataNascimento = data;
                }
              }
            ),
            const SizedBox(height: 20,),
            returnText("Nivel de experiencia"),
            Column(children:niveis.map((nivel) => RadioListTile(
              selected: nivelSelecionado == nivel.toString(),
              title: Text(nivel.toString()),
              value: nivel, 
              groupValue: nivelSelecionado, 
              onChanged: (value) {
                setState(() {
                  nivelSelecionado = value.toString();
                });
              }
              )).toList(), ),
            const SizedBox(height: 20,),
            returnText("Linguagem Favorita"),
            const SizedBox(height: 20,),
            Column(
              children: linguagens.map((item) => 
              CheckboxListTile(
                
                title: Text(item.toString()),
                value: linguagensSelecionadas.contains(item.toString()),
                onChanged: (value) {
                  if (value == true) {
                    setState(() {
                      linguagensSelecionadas.add(item.toString());
                    });
                  } else {
                    setState(() {
                      linguagensSelecionadas.remove(item.toString());
                    });
                  }
                })
            ).toList(),),
            const SizedBox(height: 20,),
            returnText("Tempo de experiencia"),
            DropdownButton(
              isExpanded: true,
              value: tempoDeExperiencia,
              items: returnItens(51),
              onChanged: (value) {
                setState(() {
                  tempoDeExperiencia = int.parse(value.toString());
                });
              },),
            const SizedBox(height: 20,),
            returnText("Pretenção Salarial. R\$ ${salarioEscolhido.toStringAsFixed(2)}"),
            Slider(
              min: 0,
              max: 10000,
              value: salarioEscolhido,
              onChanged: (double value){
                setState(() {
                  salarioEscolhido = value;
                });
              },
            ),
            TextButton(onPressed: () {
              setState(() {
                salvando = false;
              });
              if (nomeController.text.trim().length < 3) {
                validate("Nome deve ter pelo menos 3 caracteres");
                                return;
              }
              if (dataNascimento == null) {
                validate("Data de nascimento é obrigatório");
                                return;
              }
              if (nivelSelecionado == "") {
                validate("Nivel de experiencia é obrigatório");
                return;
              }
              
              setState(() {
                salvando = true;
              });


              Future.delayed(const Duration(seconds: 2), () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Dados salvos com sucesso")));
                setState(() {
                salvando = false;
              });
              Navigator.pop(context);
              });

            }, child: const Text("Salvar"))
          ],
        ),
      )
    );
  }
}