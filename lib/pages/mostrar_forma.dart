import 'package:desafio2_firebase/data/database.dart';
import 'package:desafio2_firebase/models/seleccion_modelo.dart';
import 'package:desafio2_firebase/providers/seleccion_figura_provider.dart';
import 'package:desafio2_firebase/widgets/seleccion_figura.dart';
import 'package:flutter/material.dart';

class MostrarFiguraPage extends StatelessWidget {
  final db = new DataBase();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirugaSeleccionadaProvider.streamFiguraSeleccionada,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          FirugaSeleccionadaProvider().cargar();
        } else {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: Center(child: _MostrarFigura(snapshot))),
                SizedBox(height: 80),
                ElevatedButton(
                    onPressed: () {
                      FirugaSeleccionadaProvider().limpiarLista();
                      Navigator.pop(context);
                    },
                    child: Text('Regresar')),
                ElevatedButton(
                    onPressed: () {
                      final nuevaCombinacion = SeleccionModelo(
                          color: snapshot.data[1],
                          descripcion: snapshot.data[0],
                          codigo: '0');
                      db.nuevaCombinacion(nuevaCombinacion);
                    },
                    child: Text('Agregar Combinación')),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}

class _MostrarFigura extends StatefulWidget {
  AsyncSnapshot<dynamic> snapshot;
  _MostrarFigura(this.snapshot);

  @override
  __MostrarFiguraState createState() => __MostrarFiguraState();
}

class __MostrarFiguraState extends State<_MostrarFigura>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> agrandar;
  late Animation<double> achicar;
  late Animation<double> opacidad;
  late Animation<double> moverderecha;
  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    agrandar = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    achicar = Tween(begin: 2.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.6, 1.0, curve: Curves.easeOut)));
    opacidad = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.8, curve: Curves.easeOut)));

    moverderecha = Tween(begin: -150.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.4, curve: Curves.easeInOut)));

    //  controller.addListener(() {
    // if (controller.status == AnimationStatus.completed) {
    //   controller.;
    // }
    //  });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        child: Figura(widget.snapshot.data[0], widget.snapshot.data[1]),
        builder: (BuildContext contex, Widget? childContainer) {
          return Transform.translate(
            offset: Offset(moverderecha.value, 0.0),
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                scale: achicar.value,
                child: Transform.scale(
                  scale: agrandar.value,
                  child: childContainer,
                ),
              ),
            ),
          );
        });
  }
}
