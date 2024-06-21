
import 'package:go_router/go_router.dart';
//Importa todas las pantllas que se van a usar
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(

  //La pantalla inicial
  initialLocation: "/",

  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(), 
    ),
    GoRoute(
      path: "/buttons",
      builder: (context, state) => const ButtonsScreen(), 
    ),
    GoRoute(
      path: "/cards",
      builder: (context, state) => const CardsScreen(), 
    ),
  ],
);