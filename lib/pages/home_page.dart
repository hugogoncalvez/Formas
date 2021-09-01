import 'package:desafio2_firebase/models/color_modelo.dart';
import 'package:desafio2_firebase/models/forma_modelo.dart';
import 'package:desafio2_firebase/providers/color_provider.dart';
import 'package:desafio2_firebase/providers/db_provider.dart';
import 'package:desafio2_firebase/providers/forma_provider.dart';
import 'package:desafio2_firebase/providers/seleccion_figura_provider.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formas y Colores'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 1,
            ),
            _DropButtomFormas(),
            _DropButtomColores(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'mostrarFigura');
                      },
                      child: Text('Mostrar Figura')),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        DBProvider().obtenerCombinaciones();
                        Navigator.pushNamed(context, 'mostrarCombinaciones');
                      },
                      child: Text('Mostrar Combinciones')),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}

class _DropButtomFormas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: StreamBuilder(
        stream: FigurasProvider.streamFigurasController,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) return Container();

          return Container(
            width: double.infinity,
            height: 40,
            child: DropdownButtonFormField(
                onChanged: (_) {},
                hint: Text('Seleccione Opción'),
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                items: snapshot.data
                    .map<DropdownMenuItem<String>>((FormaModelo value) {
                  return DropdownMenuItem(
                    onTap: () {
                      final valor = value.descripcion;
                      FirugaSeleccionadaProvider().cargarSeleccion(valor);
                    },
                    value: value.id,
                    child: Text(value.descripcion),
                  );
                }).toList()),
          );
        },
      ),
    );
  }
}

class _DropButtomColores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: StreamBuilder(
        stream: ColorProvider.streamColoresController,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) return Container();

          return Container(
            width: double.infinity,
            height: 40,
            child: DropdownButtonFormField(
                onChanged: (_) {},
                hint: Text('Seleccione Opción'),
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                items: snapshot.data
                    .map<DropdownMenuItem<String>>((ColorModelo value) {
                  return DropdownMenuItem(
                    onTap: () {
                      final valor = value.color;
                      FirugaSeleccionadaProvider().cargarSeleccion(valor);
                    },
                    value: value.color,
                    child: Text(value.descripcion),
                  );
                }).toList()),
          );
        },
      ),
    );
  }
}

// 0xff0ffff4, 0xffff3fc3,  0xffffd459
