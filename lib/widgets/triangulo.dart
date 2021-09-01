import 'package:flutter/material.dart';
import 'dart:math';

class Triangulo extends StatelessWidget {
  final String color;

  const Triangulo({required this.color});

  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    int randomValor = (random.nextInt(80) + 80);
    return Container(
      width: randomValor.toDouble(),
      height: randomValor.toDouble(),
      //color: Colors.red,
      child: CustomPaint(
        painter: _TrianguloPainter(color),
      ),
    );
  }
}

class _TrianguloPainter  extends CustomPainter  {
  final String color;

  _TrianguloPainter(this.color);

 
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // lapiz para dibujar
    //propiedades del lapiz
    lapiz.color = Color(int.parse(color));
    lapiz.style = PaintingStyle.fill; // solo bordes
    lapiz.strokeWidth = 10;

    final path = new Path();

    path.moveTo(size.width * 0.50, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.moveTo(size.width * 0.50,
        0); // Cambiando esta linea se pinta la parte de arriba o abajo
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
