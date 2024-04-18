import 'package:flutter/material.dart';
import 'lista_de_compras_model.dart';

class DetalhesListaPage extends StatefulWidget {
  final ListaDeCompras listaDeCompras;

  DetalhesListaPage({required this.listaDeCompras});

  @override
  _DetalhesListaPageState createState() => _DetalhesListaPageState();
}

class _DetalhesListaPageState extends State<DetalhesListaPage> {
  void _removerItem(int index) {
    setState(() {
      widget.listaDeCompras.itens.removeAt(index);
    });
  }

  void _marcarComoComprado(int index, bool valor) {
    setState(() {
      widget.listaDeCompras.itens[index].comprado = valor;
    });
  }

  void _mostrarDialogoNovoItem() {
    String nomeItem = '';
    String quantidadeItem = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Novo Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Nome do Item'),
                onChanged: (value) => nomeItem = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                onChanged: (value) => quantidadeItem = value,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                if (nomeItem.isNotEmpty && quantidadeItem.isNotEmpty) {
                  int quantidade = int.parse(quantidadeItem);
                  setState(() {
                    widget.listaDeCompras.itens.add(
                      ItemDeCompra(nome: nomeItem, quantidade: quantidade, comprado: false)
                    );
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listaDeCompras.nome),
      ),
      body: ListView.builder(
        itemCount: widget.listaDeCompras.itens.length,
        itemBuilder: (context, index) {
          final item = widget.listaDeCompras.itens[index];
          return ListTile(
            title: Text(item.nome),
            subtitle: Text('Quantidade: ${item.quantidade}'),
            trailing: Wrap(
              spacing: 8, // space between two icons
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _removerItem(index),
                ),
                Checkbox(
                  value: item.comprado,
                  onChanged: (valor) => _marcarComoComprado(index, valor!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoNovoItem,
        tooltip: 'Adicionar Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
