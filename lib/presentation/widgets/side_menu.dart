import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0; // Variable para saber qué opción del menú se selecciona

  @override
  Widget build(BuildContext context) {

    //Se verifica que si el valor es mayor a 35, entonces asigna que hay un notch
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35; 

    return NavigationDrawer(
      selectedIndex: navDrawerIndex, //Permite marcar una opción marcada de forma predeterminada
      onDestinationSelected: (value){ //Marca la opción seleccionada del menú
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem =  appMenuItems[value];
        context.push(menuItem.link);
        //Permite acceder al estado del Scaffold y cerrar el menú 
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children: [

        
        Padding(
          //Se evalua con un ternario si existe el notch, se asigna 10 pred y si no cumple es 20
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20 ,16,10),
          child: const Text("Main"),
        ),

        //Operador "Spread"
        //Se obtienen los valores del menu
        ...appMenuItems
        .sublist(0,3) //Se obtienen los primeros 3 elementos
        .map((item) => NavigationDrawerDestination(
          icon:  Icon(item.icon), 
          label: Text(item.title)
        ),),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ), 

        const Padding(
          padding: EdgeInsets.fromLTRB(28,10,16,10),
          child:  Text("More options"),
        ),

        ...appMenuItems
        .sublist(3) //Se obtiene del elemento 3 en adelante 
        .map((item) => NavigationDrawerDestination(
          icon:  Icon(item.icon), 
          label: Text(item.title)
        ),),

        

      ],
    );
  }
}