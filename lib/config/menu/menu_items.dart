/** ESTA CLASE PERMITE CONTROLAR LAS OPCIONES
 * QUE SE ENCUENTRAN DISPONIBLES EN EL MENÚ
 */

import 'package:flutter/material.dart';

class MenuItems{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  //Indica que los objetos jamás van a cambiar cuando sean construidos
  const MenuItems({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });

}

const appMenuItems = <MenuItems>[
  
  MenuItems(
    title: "Contador",
    subTitle: "Contador con Riverpod",
    link: "/counter",
    icon: Icons.add,
  ),
  MenuItems(
    title: "Botones",
    subTitle: "Varios botones en Flutter",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: "Tarjetas",
    subTitle: "Un contenedor estilizado",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: "ProgressIndicators",
    subTitle: "Generales y controlados",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: "Snackbars y diálogos",
    subTitle: "Indicadores en pantalla",
    link: "/snackbars",
    icon: Icons.info_outline_sharp,
  ),
  MenuItems(
    title: "Animated container",
    subTitle: "Stateful widget animado",
    link: "/animated",
    icon: Icons.check_box_outlined,
  ),
  MenuItems(
    title: "UI Controls + Tiles",
    subTitle: "Una serie de controles en Flutter",
    link: "/ui-controls",
    icon: Icons.car_rental_outlined,
  ),
  MenuItems(
    title: "Introducción a la aplicación",
    subTitle: "Pequeño tutorial introductorio",
    link: "/tutorial",
    icon: Icons.accessible_rounded,
  ),
  MenuItems(
    title: "Infinite scroll y pull",
    subTitle: "Listas infinitas y Pull To Refresh",
    link: "/infinite",
    icon: Icons.list_alt_rounded,
  ),
  MenuItems(
    title: "Cambiar tema",
    subTitle: "Cambiar tema de la aplicación",
    link: "/theme-changer",
    icon: Icons.color_lens_outlined,
  ),

];