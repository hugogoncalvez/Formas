import 'package:desafio2_firebase/models/seleccion_modelo.dart';
import 'package:desafio2_firebase/providers/db_provider.dart';

import 'package:desafio2_firebase/widgets/seleccion_figura.dart';
import 'package:flutter/material.dart';

class CombinacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Combinaciones'),
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(),
              onPressed: (() {
                DBProvider().sincronizar();
              }),
              icon: Icon(Icons.sync),
              label: Container(
                width: 75,
                child: Text('Sincronizar'),
              ),
            )
          ],
        ),
        body: StreamBuilder(
            stream: DBProvider.streamDBProvider,
            builder: (BuildContext contex, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return Container(
                  child: Center(
                    child: Text('No Hay Datos'),
                  ),
                );

              final List<SeleccionModelo> lista = snapshot.data;

              return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (_, index) {
                    return Column(children: [
                      ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          child: Figura(
                              lista[index].descripcion, lista[index].color),
                        ),
                        title: Text(
                          lista[index].descripcion,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18.0),
                        ),
                        trailing: (lista[index].codigo != '0')
                            ? Text('Sincronizado',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold))
                            : Text('No Sincronizado',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ]);
                  });
            }));
  }
}
