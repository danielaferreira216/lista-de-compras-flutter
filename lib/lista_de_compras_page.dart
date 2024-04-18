import 'package:flutter/material.dart';
import 'listas_manager.dart';
import 'detalhes_lista_page.dart';
import 'lista_de_compras_model.dart';
import 'criar_lista_page.dart';

class ListaDeComprasPage extends StatefulWidget {
  @override
  _ListaDeComprasPageState createState() => _ListaDeComprasPageState();
}

class _ListaDeComprasPageState extends State<ListaDeComprasPage> {
  void _updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Listas de Compras'),
      ),
      body: ListView.builder(
        itemCount: ListasManager.listas.length,
        itemBuilder: (context, index) {
          final lista = ListasManager.listas[index];
          return ListTile(
            title: Text(lista.nome),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetalhesListaPage(listaDeCompras: lista)),
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ListasManager.removerLista(index);
                _updateUI();
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CriarListaPage()),
          ).then((_) => _updateUI());
        },
        tooltip: 'Adicionar Lista',
        child: Icon(Icons.add),
      ),
    );
  }
}
