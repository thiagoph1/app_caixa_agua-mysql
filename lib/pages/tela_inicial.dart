import 'package:app_caixa_agua/pages/tela_historico.dart';
import 'package:flutter/material.dart';
import '../models/dados.dart';
import '../repositories/dados_repository.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SizedBox(
        child: FutureBuilder<List<Dados>>(
            future: baixarJson(),
            builder: (context, objeto) {
              if (objeto.hasData) {
                List<Dados>? dados = objeto.data;
                return TelaHistorico(dados!);
              } else if (objeto.hasError) {
                return Text('${objeto.error}');
              } else {
                return const SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text('CAIXA D\'ÁGUA'),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                baixarJson();
              });
            },
            icon: const Icon(Icons.update_rounded))
      ],
    );
  }
}
