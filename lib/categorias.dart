import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:restaurante/inventario.dart';

class Categoria {
  String nombre;
  String id;
  Categoria({this.nombre,this.id,});
  factory Categoria.fromMap(Map<String, dynamic> obj) {
    return Categoria(
        nombre: obj['nombre'],
        id: obj['id'],
    );
  }
}

class Categorias extends StatefulWidget {
  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  
  List<Categoria> categorias = [
    Categoria(id: "1", nombre: "Licores"),
    Categoria(id: "2", nombre: "Carnes"),
    Categoria(id: "3", nombre: "Embutidos"),
    Categoria(id: "4", nombre: "Condimentos"),
    Categoria(id: "5", nombre: "Cereales"),
    Categoria(id: "6", nombre: "Lacteos"),
    Categoria(id: "7", nombre: "Verduras"),
    Categoria(id: "8", nombre: "Aceites"),
    Categoria(id: "9", nombre: "Bebidas"), 
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              'Inventario',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: categorias.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(241, 236, 235, 1), width: 1)),
                  child: ListTile(
                    onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (BuildContext context) => Inventario()));
                },
                    leading: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    title: Text(
                      categorias[index].nombre,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );},
              )
            ),
      );}}