// counter Screen
// simbolo "+" Icons.add

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

// Pasa de ser un StatelessWidget a ConsumerWidget
class CounterScreen extends ConsumerWidget {

  static const String name = "counter_screen";

  const CounterScreen({super.key});

  @override
  //Se agrega "WidgetRef" con el nombre "ref"
  Widget build(BuildContext context, WidgetRef ref) {

    //Cada que el counterProvider cambia, se obtiene el nuevo valor y lo redibuja
    final int clickCounter = ref.watch( counterProvider );
    final isDarkMode = ref.watch(  themeProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          
          IconButton(
            icon: isDarkMode == false ? FadeIn(child: const Icon(Icons.light_mode_outlined)) : 
            FadeIn(child: const Icon(Icons.dark_mode_outlined)), 

            onPressed: (){
              ref.read(themeProvider.notifier).state = !ref.read(themeProvider.notifier).state;

              //Otra forma de realizar lo de arriba
              //ref.read( themeProvider.notifier ).update((isDarkMode) => !isDarkMode);
            
            },
            
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor: $clickCounter", style: Theme.of(context).textTheme.titleLarge,)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //Debido a que el estado es un entero, se le puede ir sumando el mismo valor 
          //En este punto se lee si ha habido un cambio y a la vez se notifica
          ref.read(counterProvider.notifier).state++;

          //De esta forma igual se lee el estado de la app, se obtiene el valor y se le suma 1
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        }
      ),

    );
  }
}
