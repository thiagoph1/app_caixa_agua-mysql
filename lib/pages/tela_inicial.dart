import 'package:app_caixa_agua/pages/tela_historico.dart';
import 'package:flutter/material.dart';
import '../models/dados.dart';
import '../repositories/dados_repository.dart';

/* Tela Inical
  Onde aparece mensagem de erro se tiver, indicador circular se tiver carregando;
  Ou encaminha para a Tela Historica se tiver dados.

 */

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}
class _TelaInicialState extends State<TelaInicial> {
  @override
/*------------------------------------------------------------------------*/
  // Build
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
/*------------------------------------------------------------------------*/
  // App Bar - Barra Superi
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