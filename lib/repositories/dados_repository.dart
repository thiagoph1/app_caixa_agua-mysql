import 'dart:convert';
import 'package:http/http.dart' show get;
import '../models/dados.dart';
/* Class com somente uma função, baixar os dados do Servidor
  Função sem tela, inicializa a aplicação

 */
Future<List<Dados>> baixarJson() async {
  
  // Url da aplicação que recebe a requisição e responde com os dados
  var url = "http://192.168.0.25/api-caixa/index.php";

  // get da solicitação onde se demorar mais que 30 segundo da timeout
  final response = await get(Uri.parse(url)).timeout(const Duration(seconds: 30));

  // Se tiver resposta 200, cria uma lista com os dados e enviar para decodificar o json
  if (response.statusCode == 200) {
    List dados = json.decode(response.body);
    return dados.map((dados) => Dados.fromJson(dados)).toList();
    
  //outros erros lança uma exceção. 
  } if (response.request == null) {
    throw Exception('Erro na requisição'); 
  }   
  else {
    throw Exception('Não foi possível baixar o JSON');
  }
}