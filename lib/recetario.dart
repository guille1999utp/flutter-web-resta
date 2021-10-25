import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'nuevareceta.dart';

void main() => runApp(Recetario());

class Recetario extends StatefulWidget {
  @override
  _RecetarioState createState() => _RecetarioState();
}

class _RecetarioState extends State<Recetario> {
  List<Recetas> recetas = [];
  final textcontroller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NuevaReceta()));
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                )),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Center(
                child: Text(
                  'Recetario',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            body: ListView.builder(
                itemCount: recetas.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(241, 236, 235, 1),
                              width: 1)),
                      child: Slidable(
                        secondaryActions: [
                          IconSlideAction(
                            icon: Icons.delete,
                            caption: "Eliminar",
                            color: Colors.red,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                      "estas seguro que quieres eliminar este producto?"),
                                  actions: [
                                    MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "cancelar",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        elevation: 5),
                                    MaterialButton(
                                        onPressed: () {
                                          recetas.remove(recetas[index]);
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "aceptar",
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        elevation: 5),
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                        actionPane: null,
                        child: null,
                      ));
                })));
  }
}

class Recetas {
  String id;
  String producto;

  Recetas({this.id, this.producto});
  factory Recetas.fromMap(Map<String, dynamic> obj) {
    return Recetas(id: obj['id'], producto: obj['producto']);
  }
}
