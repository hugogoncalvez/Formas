import 'package:flutter/material.dart';

import 'package:desafio2_firebase/widgets/circulo.dart';
import 'package:desafio2_firebase/widgets/cuadrado.dart';
import 'package:desafio2_firebase/widgets/triangulo.dart';

class Figura extends StatelessWidget {
  final String figuraSeleccionada;
  final String colorSeleccionado;
  Figura(this.figuraSeleccionada, this.colorSeleccionado);
  @override
  Widget build(BuildContext context) {
    
    String color = colorSeleccionado;
   

    if (figuraSeleccionada == 'Cuadrado') {
      return Cuadrado(color: color);
    } else if (figuraSeleccionada == 'Círculo') {
      return Circulo(color: color);
    } else {
      return Triangulo(color: color);
    }
  }
}
