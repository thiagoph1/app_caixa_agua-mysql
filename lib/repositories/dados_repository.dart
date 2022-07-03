import 'dart:convert';
import 'package:http/http.dart' show get;

import '../models/dados.dart';


Future<List<Dados>> baixarJson() async {
  var url = "http://192.168.0.25/api-caixa/index.php";

  final response = await get(Uri.parse(url)).timeout(const Duration(seconds: 30));

  if (response.statusCode == 200) {
    List dados = json.decode(response.body);
    return dados.map((dados) => Dados.fromJson(dados)).toList();
  } if (response.request == null) {
    throw Exception('Erro na requisição'); 
  } 
  
  else {
    throw Exception('Não foi possível baixar o JSON');
  }
}