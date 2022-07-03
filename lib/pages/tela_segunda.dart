import 'package:flutter/material.dart';
import '../models/dados.dart';

class TelaSegunda extends StatefulWidget {
  final Dados valor;

  const TelaSegunda({Key? key, required this.valor}) : super(key: key);

  @override
  _TelaSegundaState createState() => _TelaSegundaState();
}

class _TelaSegundaState extends State<TelaSegunda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela Detalhes")),
      body: Center(
          child: Column(
        children: [
          const Padding(
              child: Text(
                'Dados Detalhes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              padding: EdgeInsets.only(bottom: 20.0)),
          Padding(
              child: Text('ID: ${widget.valor.id}'),
              padding: const EdgeInsets.all(20)),
          Padding(
              child: Text('VOLUME: ${widget.valor.volume}'),
              padding: const EdgeInsets.all(20)),
          Padding(
              child: Text('DISTANCIA: ${widget.valor.distancia}'),
              padding: const EdgeInsets.all(20)),
          Padding(
              child: Text('DATO E HORA: ${widget.valor.data}'),
              padding: const EdgeInsets.all(20)),
        ],
      )),
    );
  }
}