import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Bem-vindo ao seu aplicativo!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
