import 'package:flutter/material.dart';
import 'database_helper.dart'; // Adiciona o helper do banco de dados

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _register() async {
    try {
      bool registered = await DatabaseHelper.db.newUser(_emailController.text, _passwordController.text);
      if (registered) {
        // Se o registro for bem-sucedido, navegue para a tela inicial
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        // Em caso de falha no registro, exibe uma mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Este e-mail já está em uso')),
        );
      }
    } catch (error) {
      // Em caso de erro, exibe uma mensagem de erro
      print('Erro durante o registro: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha no registro: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
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
              onPressed: _register,
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
