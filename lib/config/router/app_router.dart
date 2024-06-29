
import 'package:go_router/go_router.dart';
//Importa todas las pantllas que se van a usar
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(

  //La pantalla inicial
  initialLocation: "/",

  routes: [
    GoRoute(
      path: "/",
      name: HomeScreen.name, //Se pone el nombre de la ruta (opcional)
      builder: (context, state) => const HomeScreen(), 
    ),
    GoRoute(
      path: "/buttons",
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(), 
    ),
    GoRoute(
      path: "/cards",
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(), 
    ),
    GoRoute(
      path: "/progress",
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(), 
    ),
    GoRoute(
      path: "/snackbars",
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(), 
    ),
    GoRoute(
      path: "/animated",
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(), 
    ),
  ],
);