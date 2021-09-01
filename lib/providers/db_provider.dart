import 'dart:async';

import 'package:desafio2_firebase/data/database.dart';
import 'package:desafio2_firebase/models/seleccion_modelo.dart';
import 'package:desafio2_firebase/services/figuras_services.dart';

class DBProvider {
  static final DBProvider _dbProvider = new DBProvider._();

  DBProvider._();

  factory DBProvider() {
    return _dbProvider;
  }

  static final StreamController<List<SeleccionModelo>> _dbController =
      new StreamController.broadcast();

  List<SeleccionModelo> lista = [];

  static Stream<List<SeleccionModelo>> get streamDBProvider =>
      _dbController.stream;

  void obtenerCombinaciones() async {
    final db = new DataBase();
    this.lista = await db.getCombinaciones();
    _dbController.sink.add(this.lista);
  }

  void sincronizar() {
    SeleccionModelo combinacionesNoSincronizadas;
    for (var item in lista) {
      if (item.codigo == '0') {
        combinacionesNoSincronizadas = SeleccionModelo(
          color: item.color.toString(),
          descripcion: item.descripcion,
        );
        Servicios().guardarFirebase(combinacionesNoSincronizadas);
      }
    }
  }

  dispose() {
    _dbController.close();
  }
}
