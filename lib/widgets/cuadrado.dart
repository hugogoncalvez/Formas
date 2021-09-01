import 'package:flutter/material.dart';
import 'dart:math';

class Cuadrado extends StatelessWidget {
  final String color;

  const Cuadrado({required this.color});

  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    int randomValor = (random.nextInt(80) + 80);

    return Container(
      width: randomValor.toDouble(),
      height: randomValor.toDouble(),
      decoration: BoxDecoration(color: Color(int.parse(color))),
    );
  }
}
