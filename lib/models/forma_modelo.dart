// To parse this JSON data, do
//
//     final formaModelo = formaModeloFromJson(jsonString);

import 'dart:convert';

FormaModelo formaModeloFromJson(String str) => FormaModelo.fromJson(json.decode(str));

String formaModeloToJson(FormaModelo data) => json.encode(data.toJson());

class FormaModelo {
    FormaModelo({
        this.id,
        required
        this.descripcion,
    });

    String? id;
    String descripcion;

    factory FormaModelo.fromJson(Map<String, dynamic> json) => FormaModelo(
        id: json["id"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
    };
}
