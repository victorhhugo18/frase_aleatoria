import 'package:flutter/material.dart';
import 'package:frase_aleatoria/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    carrega();
  }

  void carrega() async {
    try {
      controller.resultado = await controller.buscarFrase();
      setState(() {
        print(controller.resultado);
      });
    } catch (e) {
      print('Erro ao buscar frase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Frases aleatórias'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Image(
              image: AssetImage('assets/images/img1.jpg'),
              width: 150,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            color: Colors.black,
            elevation: 20.0,
            child: Container(
              width: 350,
              height: 200,
              padding: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  controller.resultado,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              carrega();
            },
            child: Text('Atualizar frase', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              fixedSize: Size(200, 50),
            ),
          ),
        ]));
  }
}
