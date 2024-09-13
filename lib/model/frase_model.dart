import 'dart:convert';
import 'package:http/http.dart' as http;

class FraseModel {
  String? frase;
  String? autor;


  FraseModel({this.frase, this.autor});

  FraseModel.fromJson(Map<String, dynamic> json) {
    frase = json['frase'];
    autor = json['autor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frase'] = this.frase;
    data['autor'] = this.autor;
    return data;
  }

  static Future<FraseModel> buscarFrase() async {
    final response =
        await http.get(Uri.parse('https://estevaorada.com/aulas/api/frases/'));

    if (response.statusCode == 200) {
      return FraseModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Falha ao obter frase!');
    }
  }

}