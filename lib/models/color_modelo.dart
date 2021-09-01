// To parse this JSON data, do
//
//     final colorModelo = colorModeloFromJson(jsonString);

import 'dart:convert';

ColorModelo colorModeloFromJson(String str) => ColorModelo.fromJson(json.decode(str));

String colorModeloToJson(ColorModelo data) => json.encode(data.toJson());

class ColorModelo {
    ColorModelo({
        this.id,
        required
        this.descripcion,
        required
        this.color,
    });

    String? id;
    String descripcion;
    String color;

    factory ColorModelo.fromJson(Map<String, dynamic> json) => ColorModelo(
        id: json["id"],
        descripcion: json["descripcion"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "color": color,
    };
}
