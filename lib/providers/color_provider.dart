import 'dart:async';

import 'package:desafio2_firebase/models/color_modelo.dart';
import 'package:desafio2_firebase/services/figuras_services.dart';




class ColorProvider {
  static final ColorProvider _coloresProvider = new ColorProvider._();

  ColorProvider._();

  factory ColorProvider() {
    return _coloresProvider;
  }

  static final StreamController<List<ColorModelo>>
      _streamSeleccionColoresController = new StreamController.broadcast();

  List<ColorModelo> lista = [];

  static Stream<List<ColorModelo>> get streamColoresController =>
      _streamSeleccionColoresController.stream;

 

  void cargarColores() async {
    this.lista = [];
    this.lista.addAll(lista);
    lista = await Servicios().coloresFirebase();
    _streamSeleccionColoresController.sink.add(this.lista);
  }
 

  dispose() {
    _streamSeleccionColoresController.close();
  }
}