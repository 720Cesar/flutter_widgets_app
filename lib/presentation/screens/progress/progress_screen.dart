import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = "progress_screen";

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress indicators"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text("Circular progress indicator"),
          SizedBox(height: 10,),
          //Crea circulo de carga 
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45,),

          SizedBox(height: 20,),
          Text("Circular y linear controlado"),
          SizedBox(height: 10,),

          _ControlledProgressIdicator(),

        ],
      ),
    );
  }
}

class _ControlledProgressIdicator extends StatelessWidget {
  const _ControlledProgressIdicator();

  @override
  Widget build(BuildContext context) {
    //Se utiliza un stream para tener un flujo de información
    //En este punto se inicia la forma de carga controlada
    return StreamBuilder( //StreamBuilder permite construir en un tiempo de ejecución
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){ //Emite un flujo cada 300 milisegundos
        return (value*2) / 100; // 0.0 - 1.0
      }).takeWhile((value) => value < 100), //Inidica que termina cuando el valor llega a 100
      builder: (context, snapshot){

        //Obtiene los valores del snapshot, si no hay ninguno se asigna un 0
        final progressValue = snapshot.data ?? 0; 

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black45,),
              const SizedBox(width: 20,),
              Expanded(
                child: LinearProgressIndicator(value: progressValue,),
              ),
            ],
          ),
        );
      }
    );
  }
}