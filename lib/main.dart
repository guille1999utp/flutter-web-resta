import 'package:flutter/material.dart';

import 'package:restaurante/inicio.dart';
import 'package:restaurante/inventario.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "inicio",
      routes: <String, WidgetBuilder>{
        'inicio': (BuildContext context) => Inicio(),
        'inventario': (BuildContext context) => Inventario(),
      },
    );
  }
}
