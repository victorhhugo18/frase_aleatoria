import 'package:flutter/material.dart';
import 'package:frase_aleatoria/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frases aleatórias',
      home: const HomeView(),
    );
  }
}