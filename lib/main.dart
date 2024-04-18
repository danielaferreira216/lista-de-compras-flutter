import 'package:flutter/material.dart';
import 'sobre_page.dart';
import 'criar_lista_page.dart';
import 'lista_de_compras_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'tela_registro.dart';
import 'esqueceu_senha.dart';
import 'database_helper.dart'; // Adicionando o helper do banco de dados

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.db.initDB(); // Inicializa o banco de dados SQLite

  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      initialRoute: '/login',
      routes: {
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/sobre': (context) => SobrePage(),
        '/reset-password': (context) => ResetPasswordPage(),
        '/listas': (context) => ListaDeComprasPage(), // Adicionada a rota para a página de listas
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - Lista de Compras'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/sobre'),
            tooltip: 'Sobre'
          ),
        ],
      ),
      body: Center(
        child: Text('Bem-vindo ao seu aplicativo de lista de compras!'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.view_list),
        onPressed: () {
          Navigator.pushNamed(context, '/listas'); // Corretamente configurado para navegar para a página de listas
        },
        tooltip: 'Ver Listas',
      ),
    );
  }
}
