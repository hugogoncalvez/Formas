
import 'package:desafio2_firebase/pages/mostrar_combinaciones.dart';
import 'package:flutter/material.dart';
import 'package:desafio2_firebase/providers/color_provider.dart';
import 'package:desafio2_firebase/providers/forma_provider.dart';
import 'package:desafio2_firebase/pages/home_page.dart';
import 'package:desafio2_firebase/pages/mostrar_forma.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FigurasProvider().cargarFiguras();
    ColorProvider().cargarColores();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'mostrarFigura': (_) => MostrarFiguraPage(),
        'mostrarCombinaciones': (_)=> CombinacionesPage()
      },
    );
  }
}
