import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = "infinite_screen";

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  //Se crea el controlador para el Scroll
  final ScrollController scrollController = ScrollController(); 
  bool isLoading = false; //Bandera que evalua si se están cargando más imagenes
  bool isMounted = true; 

  @override
  void initState() {
    super.initState();

    scrollController.addListener((){
      
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        
      }//Indica la posición actual del scroll

      loadNextPage();

    });


  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }


  // Función asincrona que permite la craga de mas imágenes y sea infinito el Scroll
  Future loadNextPage() async{
    
    if( isLoading ) return; //Si está cargando, no vuelve a lanzar la petición

    // Si no está cargando, entonces lanza la petición y lo muestra con un setState
    isLoading = true;
    setState(() {});

    // Espera dos segundos para mostrar las nuevas imágenes 
    await Future.delayed(const Duration(seconds: 2));

    // Añade las nuevas imágenes y pone la bandera en falso
    addFiveImages();
    isLoading = false;

    // Verifica si el componente está montado o no para evitar que la app se cierre
    if( !isMounted ) return;

    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onRefresh() async{
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if( !isMounted ) return; // Si el componente no está montado, retorna

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear(); // Se borran los elementos del listado
    imagesIds.add(lastId+1); // Se añade el siguiente elemento
    addFiveImages(); // Crea 5 nuevas imágenes

    setState(() {});

  }

  void moveScrollToBottom(){
    // Se ejecuta solo si se está cerca del final
    if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent ) return;
  
    scrollController.animateTo(
      //0, // Indica que se mueva al inicio del ListView
      scrollController.position.pixels + 120, 
      duration: const Duration(microseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  void addFiveImages(){
    final lastId = imagesIds.last; // Obtiene el último valor del ID
    imagesIds.addAll(
      //"e" es el elemento 1,2,3,4,5, sirve para agregar un nuevo valor
      /** Es lo equivalente a:
       * imagesIds.add( lastId + 1 );
       * imagesIds.add( lastId + 2);
       */
      [1, 2, 3, 4, 5].map((e) => lastId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, // Quita el espacio de arriba del ListView
        removeBottom: true, // Quita el espacio de abajo del ListView
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10, // Baja más el espacio del indicador
          strokeWidth: 2, // Hace la línea de la animación más delgada
          child: ListView.builder(
            controller: scrollController, //se agrega el controlador
            itemCount: imagesIds.length,
            itemBuilder: (context, index){
              return FadeInImage(
                width: double.infinity,
                height: 250,
                placeholder: const AssetImage("assets/images/jar-loading.gif"), 
                image: NetworkImage("https://picsum.photos/id/${ imagesIds[index] }/500/300"),
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton( 
        onPressed: () => context.pop(),
        
        // TAREA: Hacer que el icono cambie dependiendo de la bandera de isLoading
        // Se evalua si se está cargando, en caso de que no, se muestra un icono
        // y si se está cargando, se muestra otro icono. Se usa operadores ternarios. 
        child: isLoading == false ? FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)) : SpinPerfect(
          child: const Icon(Icons.refresh_rounded)),
      ),

    );
  }
}