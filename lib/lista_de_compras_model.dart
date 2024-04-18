// lib/lista_de_compras_model.dart
class ListaDeCompras {
  String nome;
  List<ItemDeCompra> itens; // Para simplificar, os itens serão apenas Strings por enquanto

  ListaDeCompras({required this.nome, required this.itens});
}

class ItemDeCompra {
  String nome;
  int quantidade;
  bool comprado;

  ItemDeCompra({required this.nome, required this.quantidade, this.comprado = false});
}
