// Crear estado para manejar un bool
//Estado => isDarkMode = boolean //defecto true o false
 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

// LISTADO DE COLORES INMUTABLE (NUNCA VA A PODER CAMBIAR)
final colorListProvider = Provider((ref) => colorList);

// UN SIMPLE ENTERO XDXD
final selectedColorProvider = StateProvider((ref) => 0);
