import 'package:flutter/material.dart';

import 'package:search_choices/search_choices.dart';

void main() => runApp(Ingredientes());

class Ingredientes extends StatefulWidget {
  static final navKey = new GlobalKey<NavigatorState>();
  const Ingredientes({Key navKey}) : super(key: navKey);
  @override
  IngredientesState createState() => IngredientesState();
}

class IngredientesState extends State<Ingredientes> {
  List<int> selectedItemsMultiDialogSelectAllNoneWoClear = [];

  List<DropdownMenuItem> items = [];
  List<int> selectedItemsMultiSelect3Dialog = [];

  String inputString = "";
  TextFormField input;

  static const String appTitle = "Ingredientes";
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    input = TextFormField(
      validator: (value) {
        return (value.length < 6 ? "must be at least 6 characters long" : null);
      },
      initialValue: inputString,
      onChanged: (value) {
        inputString = value;
      },
      autofocus: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets;
    widgets = {
      "Ingrediente": SearchChoices.multiple(
        items: items,
        selectedItems: selectedItemsMultiSelect3Dialog,
        hint: "Selecciona ingrediente de Inventario",
        searchHint: "Selecciona ingrediente de Inventario",
        validator: (selectedItemsForValidator) {
          if (selectedItemsForValidator.length !=
              selectedItemsForValidator.length) {
            return ("Must select 3");
          }
          return (null);
        },
        onChanged: (value) {
          setState(() {
            selectedItemsMultiSelect3Dialog = value;
          });
        },
        doneButton: (selectedItemsDone, doneContext) {
          return OutlinedButton(
              onPressed: selectedItemsDone.length != selectedItemsDone.length
                  ? null
                  : () {
                      Navigator.pop(doneContext);
                      setState(() {});
                    },
              child: Text("Guardar"));
    },
        closeButton: (selectedItemsClose) {
          return (selectedItemsClose.length == null ? "Ok" : null);
        },
        isExpanded: true,
      ),
    };

    return MaterialApp(
      navigatorKey: Ingredientes.navKey,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text(appTitle)),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: widgets
                .map((k, v) {
                  return (MapEntry(
                      k,
                      Center(
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              margin: EdgeInsets.all(20),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Text("$k:"),
                                    v,
                                  ],
                                ),
                              )))));
                })
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
