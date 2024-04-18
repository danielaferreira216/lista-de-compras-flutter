// lib/criar_lista_page.dart
import 'package:flutter/material.dart';
import 'lista_de_compras_model.dart';
import 'listas_manager.dart';

class CriarListaPage extends StatefulWidget {
  @override
  _CriarListaPageState createState() => _CriarListaPageState();
}

class _CriarListaPageState extends State<CriarListaPage> {
  final _formKey = GlobalKey<FormState>();
  String _nomeDaLista = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final novaLista = ListaDeCompras(nome: _nomeDaLista, itens: []);
      ListasManager.adicionarLista(novaLista);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar Lista de Compras')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome da Lista'),
                onSaved: (value) => _nomeDaLista = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o nome da lista.';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Criar Lista'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
