import 'dart:ui';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

void main() => runApp(Inventario());

class Inventario extends StatefulWidget {
  @override
  _InventarioState createState() => _InventarioState();
}

class _InventarioState extends State<Inventario> {


  List<Productos> produc = [
    Productos(id: "1", producto: "chorizo", cantidad: 1, precios: 44720), 
  ];
  Widget _swath() {
    var asTabs;
    return Switch(
      key: asTabs,
      activeColor: Colors.white,
      value: asTabs,
      onChanged: (bool Newvalue) {
        setState(() {
          asTabs = Newvalue;
        });
      },
    );
  }



  final textcontroller1 = TextEditingController();
  final textcontroller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          elevation: 20.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
              'Inventario',
              style:  TextStyle( 
                          fontSize: 25.0, 
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GloriaHallelujah',
                        )
                        ,
            ),
          ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Nuevo Producto"),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                          decoration: InputDecoration(hintText: "Producto"),
                          controller: textcontroller1,
                        ),
                        TextField(
                          decoration:
                              InputDecoration(hintText: "Marca Producto"),
                          controller: textcontroller2,
                        ),
                        Row(
                          children: [_swath()],
                        ),
                        Row(children: [
                          Text("Cantidad Paquetes: "),
                          Container(
                            width: 40,
                            child: TextField(
                              onChanged: (value) {},
                              style: TextStyle(fontSize: 17),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "#",
                                  hintText: "#"),
                            ),
                          )
                        ]),
                        Row(children: [
                          Text("Unidad Por Paquetes: "),
                          Container(
                            width: 40,
                            child: TextField(
                              onChanged: (value) {},
                              style: TextStyle(fontSize: 17),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "#",
                                  hintText: "#"),
                            ),
                          )
                        ]),
                        Row(children: [
                          Text("Precio Paquetes: "),
                          Container(
                            width: 40,
                            child: TextField(
                              onChanged: (value) {},
                              style: TextStyle(fontSize: 17),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "#",
                                  hintText: "#"),
                            ),
                          ),
                        ]),
                        Text("Precio total de paquetes es :"),
                      ],
                    ),
                  ),
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
                          setState(() {});
                          anadir(textcontroller1.text, context, produc);
                        },
                        child: Text(
                          "añadir",
                          style: TextStyle(color: Colors.blue),
                        ),
                        elevation: 5),
                  ],
                ),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            )),
        
        body: ListView.builder(
            itemCount: produc.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(241, 236, 235, 1), width: 1)),
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
                                    produc.remove(produc[index]);
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
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.2,
                  actions: [
                    IconSlideAction(
                      icon: Icons.attach_money_rounded,
                      caption: "Dinero",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(produc[index].producto),
                            content: Text("Tiene " +
                                "\$" +
                                produc[index].precios.toString() +
                                " del producto: " +
                                produc[index].producto),
                            actions: [
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "ok",
                                  ),
                                  elevation: 5),
                            ],
                          ),
                        );
                      },
                      color: Colors.green,
                    ),
                    IconSlideAction(
                      icon: Icons.info_outline,
                      caption: "Info",
                      color: Colors.grey,
                    )
                  ],
                  child: ListTile(
                    leading: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                    title: Text(
                      produc[index].producto,
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Text(produc[index].cantidad.toString() + " Kg"),
                  ),
                ),
              );
            }),
      ),
    );
  }

  String resultado(valor1, valor2, valor3) {
    var n1 = valor1;
    var n2 = valor2;
    var n3 = valor3;
    print(n1);
    print(n2);
    print(n3);
    if (n1 == null) {
      n1 = 0;
    }
    if (n2 == null) {
      n2 = 0;
    }
    if (n3 == null) {
      n3 = 0;
    }
    var multiplicar = n1 + n2 + n3;
    var resultado = multiplicar;
    print(resultado.toString());
    return resultado.toString();
  }
}

void anadir(String name, context, activas) {
  print(activas);
  if (name.length > 2) {
    activas.add(new Productos(
        id: DateTime.now().toString(), producto: name, cantidad: 0));
  }

  Navigator.pop(context);
}

class Productos {
  String categoria;
  String id;
  String producto;
  int cantidad;
  int precios;
  Productos({this.categoria,this.id, this.producto, this.cantidad, this.precios});
  factory Productos.fromMap(Map<String, dynamic> obj) {
    return Productos(
        categoria: obj['categoria'],
        id: obj['id'],
        producto: obj['producto'],
        cantidad: obj['cantidad'],
        precios: obj['precios']);
  }
}
