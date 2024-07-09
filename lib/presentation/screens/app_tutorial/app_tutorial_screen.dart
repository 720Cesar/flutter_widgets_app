import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {

  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);

}

final slides = <SlideInfo>[
  SlideInfo("Busca la comida", "Adipisicing nisi officia laboris sint ex adipisicing irure.", "assets/images/1.png"),
  SlideInfo("Entrega rápida", "Incididunt non aute enim consequat duis elit veniam occaecat ullamco consequat ipsum do ut anim.", "assets/images/2.png"),
  SlideInfo("Disfruta la comida", "Reprehenderit dolor sit nostrud anim ut aute ex incididunt excepteur officia enim.", "assets/images/3.png"),

];



class AppTutorialScreen extends StatefulWidget {

  static const name = "tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  // Controlador para saber en qué slide está el usuario
  final PageController pageViewController = PageController();

  // Bandera que permite saber cuando el usuario está en el ultimo slide
  bool endReached  = false;

  @override
  void initState() {
    super.initState();

    // No regresa nada porque no necesita nada
    pageViewController.addListener(() {
      // Permite ver en qué pagina nos encontramos
      // NOTA: Los valores de las páginas son double, es decir, puede ser 0.1, 0.5 hasta llegar a 1
      final page = pageViewController.page ?? 0; // Si no hay valor, entonces 0
      if ( !endReached && page >= (slides.length)-1.5 ){
        setState(() {
          // Se ejecuta una única vez nada más
          endReached = true;
        });
      }
      //print("${ pageViewController.page }");
    
    });
  }

  @override
  void dispose() {
    // Se llama al dispose de controlador para ahorrar memoria
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              )
            ).toList(), //Se convierte a lista de iterables
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text("Salir"),
              onPressed: () => context.pop(),
            ),
          ),

          // BOTÓN "COMENZAR" PARA PODER SALIR DE LA INTRODUCCIÓN
          // Si llegamos al slide final, entonces renderiza el botón
          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15, // Recorre 15 unidades
              delay: const Duration(seconds: 1), // Tarda 1 segundo en comenzar
              child: FilledButton(
                onPressed: ()=>context.pop(),
                child: const Text("Comenzar"),
              ),
            ) 
          ): const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image( image: AssetImage(imageUrl),),
            const SizedBox(height: 20),
            Text(title, style: titleStyle,),
            const SizedBox(height: 20,),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
    );
  }
}