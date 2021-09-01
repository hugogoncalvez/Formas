import 'dart:async';

import 'package:desafio2_firebase/models/forma_modelo.dart';
import 'package:desafio2_firebase/services/figuras_services.dart';


class FigurasProvider {
  static final FigurasProvider _figurasProvider = new FigurasProvider._();

  FigurasProvider._();

  factory FigurasProvider() {
    return _figurasProvider;
  }

  static final StreamController<List<FormaModelo>>
      _streamSeleccionFigurasController = new StreamController.broadcast();

  List<FormaModelo> lista = [];
  

  static Stream<List<FormaModelo>> get streamFigurasController =>
      _streamSeleccionFigurasController.stream;

  void limpiarLista() {
    _streamSeleccionFigurasController.sink.add(List.empty());
  }

  void cargarFiguras() async {
    this.lista = [];
    this.lista.addAll(lista);
    lista = await Servicios().figurasFirebase();
    _streamSeleccionFigurasController.sink.add(this.lista);
  }

  

  dispose() {
    _streamSeleccionFigurasController.close();
  }
}
