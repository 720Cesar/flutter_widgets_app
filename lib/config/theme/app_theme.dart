
import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.pink,
  Colors.orange
];

class AppTheme{


  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  }): assert(selectedColor >= 0, "Selected color must be greater than 0",),
  assert(selectedColor < colorList.length, "Selected color must be less or equal than ${ colorList.length -1}",);

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
  );

  // MÉTODO QUE REGRESA UNA NUEVA INSTANCIA DEL APPTHEME
  // CopyWith() es un método que sirve para copiar las instancias de la clase
  // Ayuda a mantener las propiedades "final" y los estados inmutables
  // Entonces cuando cambia algo en el estado, se cree un nuevo estado basado en lo anterior
  AppTheme copyWith({

    int? selectedColor, //opcional
    bool? isDarkMode, //opcional

  }) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor, //Si no da un color, se usa el predeterminado
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
  
}