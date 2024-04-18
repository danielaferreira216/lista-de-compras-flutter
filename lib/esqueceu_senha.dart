import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _resetPassword(context),
              child: Text('Enviar Solicitação de Suporte'),
            ),
          ],
        ),
      ),
    );
  }

  void _resetPassword(BuildContext context) {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor, insira um email.'),
      ));
      return;
    }

    // Exibe uma mensagem informando ao usuário para entrar em contato com o suporte
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Recuperação de Senha"),
        content: Text("Por favor, entre em contato com o suporte para recuperar sua senha: support@yourapp.com"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
