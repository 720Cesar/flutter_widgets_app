import "dart:math" show Random; //Importa función random de la libreria
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const name = "animated_screen";

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120; //Valor minimo 50 y maximo 300
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(100) + 20;

    color = Color.fromRGBO(
      random.nextInt(255), //Red 
      random.nextInt(255), //Green
      random.nextInt(255), //Blue
      1 //Opacity
    );

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated container"),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400), //Agrega duración a la animación
          curve: Curves.bounceIn, //Crea el tipo de animación (Movimiento)
          width: width <= 0 ? 0 : width, //Previene que obtenga valores negativos
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),

    );
  }
}