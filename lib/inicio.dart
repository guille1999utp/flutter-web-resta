import 'package:flutter/material.dart';

import 'package:restaurante/inventario.dart';
import 'package:restaurante/perdida.dart';

import 'package:restaurante/recetario.dart';


void main() => runApp(Inicio());

// ignore: must_be_immutable
class Inicio extends StatelessWidget {

  List<Lista> hola = [
    new Lista(
        nombre: "Inventario",
        icono: Icon(Icons.event_available),
        rutas: (BuildContext context) => Inventario()),
    new Lista(
        nombre: "Recetarios",
        icono: Icon(Icons.cake_outlined),
        rutas: (BuildContext context) => Recetario()),
    new Lista(
        nombre: "Perdida",
        icono: Icon(Icons.delete_forever_outlined),
        rutas: (BuildContext context) => Perdidas()),
  
    
  ];

  get px => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Color.fromRGBO(45, 47,42, 1),
          actions: [
           Image.asset('assets/Logo.jpg',width:50 ,height:50 ,),
            SizedBox(
              width: 100,
            )
          ],
          title: Center(child: Text("Cava Tapas & Drink's")),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            final name = hola[index];
            return Column(children: [
              ListTile(
                title: Text(name.nombre),
                leading: name.icono,
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: name.rutas));
                },
              ),
              Divider()
            ]);
          },
        ),
      ),
    );
  }
}



class Lista {
  String nombre;
  Icon icono;
  WidgetBuilder rutas;

  Lista({@required this.nombre, @required this.icono, @required this.rutas});
}
