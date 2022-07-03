// ignore_for_file: use_key_in_widget_constructors

import 'package:app_caixa_agua/pages/tela_segunda.dart';
import 'package:flutter/material.dart';
import '../models/dados.dart';

/* TELA DE HISTORICO 
Onde é mostrado os registros do banco, podendo ser clicado os cards de informação
que será encaminhado para Tela Segunda com mais informações;
Nessa tela só é mostrado o volume em porcentagem e a data.

*/

class TelaHistorico extends StatelessWidget {
  final List<Dados> dados; // Variavel que vem da outra tela
  const TelaHistorico( this.dados);
/*------------------------------------------------------------------------*/
 // Constrói a lista
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: dados.length,
      itemBuilder: (context, int index) {
        return itemLista(dados[index], context);
      },
    );
  }
/*------------------------------------------------------------------------*/
 // Constrói os itens da lista
  Widget itemLista(Dados dados, BuildContext context) {
        return ListTile(
        title: Card(
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(children: [
                  const Padding(
                      child: Text("Volume: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.all(1.0)),
                  Padding(
                      child: Text(dados.volume + " %",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      padding: const EdgeInsets.all(1.0)),
                  const Text(" | "),
                  Padding(
                      child: Text(dados.data,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      padding: const EdgeInsets.all(1.0)),
                ])
              ],
            ),
          ),
        ),
        // Se clicar no card abre a Tela Segunda
        onTap: () {
          var rotas = MaterialPageRoute(
            builder: (BuildContext context) => TelaSegunda(valor: dados),
          );
          Navigator.of(context).push(rotas);
        },
        );
  }
}