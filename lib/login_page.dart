import 'package:flutter/material.dart';
import 'database_helper.dart';  // Certifique-se de que essa classe está corretamente implementada conforme orientado anteriormente.

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor, insira seu e-mail e senha.'),
      ));
      return;
    }

    try {
      bool loggedIn = await DatabaseHelper.db.login(_emailController.text, _passwordController.text);
      if (loggedIn) {
        // Navegação para a tela principal após login bem-sucedido
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        // Exibindo uma mensagem de erro se o login falhar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Email ou senha incorretos'),
        ));
      }
    } catch (e) {
      // Tratamento de erro, exibindo uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Falha ao entrar: ${e.toString()}'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
            SizedBox(height: 20), // Adicionando espaço entre botões
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/reset-password'); // Certifique-se de que esta rota está configurada
              },
              child: Text('Esqueceu a senha?'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/register'); // Certifique-se de que esta rota está configurada
              },
              child: Text("Não tem conta? Registre-se aqui"),
            )
          ],
        ),
      ),
    );
  }
}
