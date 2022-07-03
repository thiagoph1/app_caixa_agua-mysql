class Dados {
  final String id;
  final String volume, distancia, data;

  Dados(
      {required this.id,
      required this.volume,
      required this.distancia,
      required this.data});

  factory Dados.fromJson(Map<String, dynamic> jsonDados) {
    return Dados(
        id: jsonDados['id'],
        volume: jsonDados['volume'],
        distancia: jsonDados['distancia'],
        data: jsonDados['data']);
  }
}