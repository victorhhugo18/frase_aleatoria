import 'package:flutter/material.dart';
import 'package:frase_aleatoria/model/frase_model.dart';

class HomeController {
  TextEditingController entrada = TextEditingController();
  String resultado = "";

  Future<String> buscarFrase() async {
    // Instanciar o objeto
    FraseModel frase = FraseModel();
    frase = await FraseModel.buscarFrase();
    return '${frase.frase}\n\n${frase.autor}';
  }
}