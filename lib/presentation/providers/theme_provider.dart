// Crear estado para manejar un bool
//Estado => isDarkMode = boolean //defecto true o false
 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

// LISTADO DE COLORES INMUTABLE (NUNCA VA A PODER CAMBIAR)
final colorListProvider = Provider((ref) => colorList);

// UN SIMPLE ENTERO XDXD
final selectedColorProvider = StateProvider((ref) => 0);

// UN OBJETO DE TIPO AppTheme(custom)
// <controlador/notifier, objeto/instancia>
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(), //Instancia del ThemeNotifier
);

// Controller o Notifier
// Sirve para mantener la instancia del AppTheme y de toda su configuración
class ThemeNotifier extends StateNotifier<AppTheme>{
  // STATE = Estado = new AppTheme()
  ThemeNotifier(): super( AppTheme());

  void toggleDarkMode(){
    // El nuevo estado es una copia del estado actual 
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex( int colorIndex ){

  }


}