import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const String name = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scaffoldKey, //Referencia al estado actual del Scaffold
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      
      ),
      body: const _HomeView(),
      drawer: SideMenu( scaffoldKey: scaffoldKey,),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
        
    return ListView.builder(
        //appMenuItems es la lista que buscamos en la clase MenuItems
        itemCount: appMenuItems.length,

        itemBuilder: (context, index) {
          final menuItem = appMenuItems[index];

          return _CustomListTile(menuItem: menuItem);

        },
        
      
    );

  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      //trailing:  Icon(menuItem.icon), -> Icono a la derecha
      onTap: (){
        //FORMA DE NAVEGACIÓN EN FLUTTER PARA IR DE PANTALLA A PANTALLA
        //push permite colocar una pantalla encima de otra
        /*
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen()
          ),
        */

        //Forma de ir a otra pantalla mediante el uso de rutas
        //Navigator.pushNamed(context, menuItem.link);

        //Uso de go_router para cambiar entre pantallas
        context.push( menuItem.link);
        
        //Navegación con go_router y usando nombre
        //context.pushNamed( CardsScreen.name );
        
      },
    );
  }
}