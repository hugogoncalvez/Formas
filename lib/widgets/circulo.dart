import 'package:flutter/material.dart';
import 'dart:math';

class Circulo extends StatelessWidget {
  final String color;

  const Circulo({required this.color});

  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    int randomValor = (random.nextInt(80) + 80);
    return Container(
      width: randomValor.toDouble(),
      height: randomValor.toDouble(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(int.parse(color)),
      ),
    );
  }
}
