// lib/listas_manager.dart
import 'lista_de_compras_model.dart';

class ListasManager {
  static final List<ListaDeCompras> _listas = [];

  static List<ListaDeCompras> get listas => _listas;

  static void adicionarLista(ListaDeCompras lista) {
    _listas.add(lista);
  }

  static void removerLista(int index) {
    _listas.removeAt(index);
  }

  static void editarListaNome(int index, String novoNome) {
  _listas[index].nome = novoNome;
  }

}
