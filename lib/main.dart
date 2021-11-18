import 'package:flutter/material.dart';
import 'package:restaurante/categorias.dart';

import 'package:restaurante/inicio.dart';
import 'package:restaurante/inventario.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "categorias",
      routes: <String, WidgetBuilder>{
        'inicio': (BuildContext context) => Inicio(),
        'inventario': (BuildContext context) => Inventario(),
        'categorias': (BuildContext context) => Categorias(),
        
      },
    );
  }
}
