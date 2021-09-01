import 'dart:async';

class FirugaSeleccionadaProvider {
  static final FirugaSeleccionadaProvider _figuraSeleccionadaProvider =
      new FirugaSeleccionadaProvider._();

  FirugaSeleccionadaProvider._();

  factory FirugaSeleccionadaProvider() {
    return _figuraSeleccionadaProvider;
  }

  static final StreamController<List<String>> _figuraSeleccionadaController =
      new StreamController.broadcast();

  List<String> lista = [];

  static Stream<List<String>> get streamFiguraSeleccionada =>
      _figuraSeleccionadaController.stream;

  void cargarSeleccion(String descripcion) {

    lista.add(descripcion);
    _figuraSeleccionadaController.sink.add(this.lista);
  }

  void limpiarLista() {
   this.lista = [];
  }

  void cargar() {
    _figuraSeleccionadaController.sink.add(this.lista);
  }

  dispose() {
    _figuraSeleccionadaController.close();
  }
}
