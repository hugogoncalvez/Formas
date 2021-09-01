import 'package:desafio2_firebase/models/forma_modelo.dart';
import 'package:desafio2_firebase/models/seleccion_modelo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:desafio2_firebase/models/color_modelo.dart';

class Servicios {
  final String _baseURL = "figuras-717c2-default-rtdb.firebaseio.com";
  final List<SeleccionModelo> combinaciones = [];

  Future figurasFirebase() async {
    List<FormaModelo> listaTemp = [];
    final String _baseURL = "figuras-717c2-default-rtdb.firebaseio.com";
    final url = Uri.https(_baseURL, 'Formas.json');
    final respuesta = await http.get(url);

    final Map<String, dynamic> figurasMap = json.decode(respuesta.body);

    figurasMap.forEach((key, value) {
      final tempFigura = FormaModelo.fromJson(value);

      tempFigura.id = key;
      listaTemp.add(tempFigura);
    });
    return listaTemp;
  }

  Future coloresFirebase() async {
    List<ColorModelo> listaTemp = [];

    final url = Uri.https(_baseURL, 'Colores.json');
    final respuesta = await http.get(url);

    final Map<String, dynamic> figurasMap = json.decode(respuesta.body);

    figurasMap.forEach((key, value) {
      final tempColor = ColorModelo.fromJson(value);

      tempColor.id = key;
      listaTemp.add(tempColor);
    });
    return listaTemp;
  }

  Future guardarFirebase(SeleccionModelo combinacion) async {
    final url = Uri.https(_baseURL, 'Combinaciones.json');
    final resp = await http.post(url, body: combinacion.toJson());
    print(resp.body);
    // lo tengo  que decodificar porque viene un String
    final decodeDate = json.decode(resp.body);
    combinacion.codigo = decodeDate['name'];
    this.combinaciones.add(combinacion);
    return combinacion.codigo;
  }
}
