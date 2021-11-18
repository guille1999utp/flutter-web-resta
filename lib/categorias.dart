import 'dart:ui';
import 'package:flutter/material.dart';


class Categoria {
  String nombre;
  String id;
  String imagen;
  Categoria({this.nombre,this.id, this.imagen});
  factory Categoria.fromMap(Map<String, dynamic> obj) {
    return Categoria(
        nombre: obj['nombre'],
        id: obj['id'],
        imagen: obj['imagen'],
    );
  }
}

class Categorias extends StatefulWidget {
  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  
  List<Categoria> categorias = [
    Categoria(id: "1", nombre: "Licores", imagen: 'assets/Licores.png' ),
    Categoria(id: "2", nombre: "Carnes",imagen: 'assets/Carnes.jpg'),
    Categoria(id: "3", nombre: "Embutidos",imagen: 'assets/Embutidos.jpg'),
    Categoria(id: "4", nombre: "Condimentos",imagen: 'assets/Condimentos.png'),
    Categoria(id: "5", nombre: "Cereales",imagen: 'assets/Cereales.jpg'),
    Categoria(id: "6", nombre: "Lacteos",imagen: 'assets/Lacteos.jpg'),
    Categoria(id: "7", nombre: "Verduras",imagen: 'assets/Verduras.jpg'),
    Categoria(id: "8", nombre: "Aceites",imagen: 'assets/Aceites.jpg'),
    Categoria(id: "9", nombre: "Bebidas",imagen: 'assets/Bebidas.jpg'), 
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(117, 79, 1, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child:  Text(
                       'Inventario',
                        style: TextStyle( 
                          fontSize: 30.0, 
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GloriaHallelujah',
                        ),
                        )
          ),
        ),
           body: Container(
             color: Color.fromRGBO(216, 193, 85, 1),
             child: GridView.count(
               crossAxisCount:3,
               padding:EdgeInsets.all(20),
               mainAxisSpacing: 20,
               children: List.generate(categorias.length,(index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.all(20),
                    child:Column(
                      children: [
                        ClipRRect(
                          borderRadius:BorderRadius.circular(150.0),
                          child: Image.asset(
                            categorias[index].imagen,
                            fit: BoxFit.cover,
                            height: 500,
                            width: 500,
                    ),
                  ),
                        Text(
                          categorias[index].nombre,
                          style: TextStyle( 
                            fontSize: 25.0, 
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GloriaHallelujah',
                          ),
                          )
                      ],
                    ),
                  

                );

               }),
               ),
           ),
            ),
      );}}