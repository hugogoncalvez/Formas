import 'package:desafio2_firebase/models/seleccion_modelo.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DataBase {
  //
  static Database? _database; // instancia de la Base de Datos

//instancia de la clase personalizada, singletone con costructor privado _()
  static final DataBase db = DataBase._();

  DataBase._();

  factory DataBase() {
    return db;
  }

  Future<Database> get database async {
    //
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // path de donde esta la BD
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'DBfiguras.db');
    print(path);
    //  crear tablas
    String tabla =
        'CREATE TABLE figuras (id INTEGER PRIMARY KEY, descripcion TEXT, color TEXT, codigo TEXT)';

    //
    return await openDatabase(path, version: 2, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(tabla);
    });
  }

  // Usuarios

  Future<int> nuevaCombinacion(SeleccionModelo nuevoItem) async {
    final db = await database;
    int res = 0;
    //
    res = await db.insert(
      'figuras',
      nuevoItem.toMap(),
    );
    return res;
  }

  
  Future<List<SeleccionModelo>> getUsuario(
      {required String usuario, required String password}) async {
    List<SeleccionModelo> listaUsuarios = [];

    try {
      final db = await database;
      final res = await db.query('usuarios',
          where: 'usuario = ? and password = ?',
          whereArgs: [usuario, password]);
      listaUsuarios = (res.isNotEmpty)
          ? res.map((item) => SeleccionModelo.fromJson(item)).toList()
          : [];
    } catch (e) {
      print(e.toString());
    } finally {}
    return listaUsuarios;
  }

 Future<List<SeleccionModelo>> getCombinaciones() async {
    final db = await database;
    //
    final res = await db.query('figuras', orderBy: 'Descripcion');

    return res.isNotEmpty
        ? res.map((s) => SeleccionModelo.fromJson(s)).toList()
        : [];
  }

  Future<int> update(SeleccionModelo nuevoItem) async {
    final db = await database;

    final String sql =
        'Update platos set codigo = "${nuevoItem.id}", descripcion = "${nuevoItem.descripcion}"where codigo = "${nuevoItem.id}"';
    final res = await db.rawUpdate(sql);

    return res;
  }
}
