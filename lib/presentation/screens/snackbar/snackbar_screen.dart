import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = "snackbar_screen";

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ){
    
    //Permite cerrar el snackbar
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text("Hola mundo"),
      action: SnackBarAction(label: "OK", onPressed: (){},), //Permite cerrar el snackbar con un mensaje
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar( snackbar );

  }


  //Método para regresar una ventana de Dialogo
  void openDialog( BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false, //Permite que no se cierre el dialogo al dar fuera de la pantalla
      builder: (context) => AlertDialog(
        title: const Text("¿Estás seguro?"),
        content: const Text("Ex eiusmod nostrud esse aliquip ex officia. Lorem irure esse occaecat consequat tempor commodo anim deserunt ex sit ex sint ipsum. Ut fugiat amet eiusmod aliqua eu officia nostrud aliqua exercitation."),
        actions: [
          //context.pop() cierra el dialogo
          TextButton(onPressed: () => context.pop(), child: const Text("Cancelar"),),
          FilledButton(onPressed: () => context.pop(), child: const Text("Aceptar"),),
        ],
      ), //Significa que se construye en tiempo de ejecución
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbars y Diálogos"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 

            FilledButton(
              onPressed: (){
                //Permite mostrar un botón de diálogo
                showAboutDialog(
                  context: context,
                  children: [
                    const Text("LoDo aliqua eiusmod pariatur duis.Mollit in dolor culpa commodo aute do commodo excepteur dolore. Lorem enim velit veniam deserunt magna adipisicing qui irure. Voluptate sint et eu veniam aliquip adipisicing dolore tempor dolor consectetur cillum excepteur.")
                  ]  
                );
              }, 
              child: const Text("Licencias usadas")
            ),

            FilledButton(
              //Se muestra el dialogo al darle al botón
              onPressed: () => openDialog(context), 
              child: const Text("Mostrar diálogo"),
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text("Mostrar Snackbar"),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),

    );
  }
}