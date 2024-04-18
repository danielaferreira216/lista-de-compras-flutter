import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Este é um aplicativo de lista de compras desenvolvido com Flutter. Criado por Daniela Ferreira.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20), // Adiciona espaço entre o texto e o botão
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a página anterior
              },
              child: Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  } 
}
