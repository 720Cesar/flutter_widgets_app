import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    // "ProviderScope()" permite usar Riverpod
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    //final selectedColor = ref.watch( selectedColorProvider );
    //final isDarkMode = ref.watch( themeProvider );

    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: "Flutter Widgets", //Titulo de la aplicación
      routerConfig: appRouter, //Permite establecer las rutas de las pantallas
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),

    );
  }
}
