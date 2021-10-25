import 'package:flutter/material.dart';
import 'package:restaurante/ingredientes.dart';

void main() => runApp(NuevaReceta());

class NuevaReceta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nueva Receta'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Icon(
              Icons.food_bank_outlined,
              size: 30,
            )
          ],
        ),
        body: ListView(physics: BouncingScrollPhysics(), children: [
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: Row(children: [
                  Expanded(
                      child: Text(
                    "Nombre",
                    style: TextStyle(fontSize: 14),
                  )),
                  Container(
                    width: 250,
                    child: Center(
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(hintText: 'Producto'),
                      ),
                    ),
                  ),
                ]),
              ),
              ListTile(
                title: Text('Ingredientes'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Ingredientes()));
                },
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                title: Text('Precio Costo'),
                trailing: Text('\$ 9.000'),
              ),
              ListTile(
                title: Text('Precio Venta'),
                trailing: Text('\$ 15.000'),
              ),
              Align(
                heightFactor: 10,
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  child: Text('Agregar'),
                  style:ButtonStyle( shape: MaterialStateProperty.all (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  
                  
                  
                ),
                onPressed:(null),
              ),
              ),
          ])
        ]),
      ),
    );
  }
}
