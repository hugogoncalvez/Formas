// To parse this JSON data, do
//
//     final seleccionModelo = seleccionModeloFromJson(jsonString);

import 'dart:convert';

SeleccionModelo seleccionModeloFromJson(String str) =>
    SeleccionModelo.fromJson(json.decode(str));

// String seleccionModeloToJson(SeleccionModelo data) =>
//     json.encode(data.toJson());

class SeleccionModelo {
  SeleccionModelo(
      {this.id, required this.descripcion, required this.color, this.codigo});

  int? id;
  String descripcion;
  String color;
  String? codigo;

  factory SeleccionModelo.fromJson(Map<String, dynamic> json) =>
      SeleccionModelo(
          id: json["id"],
          descripcion: json["descripcion"],
          color: json["color"],
          codigo: json["codigo"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "descripcion": descripcion,
        "color": color,
        "codigo": codigo,
      };

  String toJson() => jsonEncode(toMap());
}
