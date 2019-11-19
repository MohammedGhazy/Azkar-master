import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:azkarapp/model/add_something.dart';
import 'package:azkarapp/add_somthing_screens/textform_field.dart';

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.pinkAccent, Colors.purpleAccent])),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'الأدعيه والأحاديث المختاره',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Aref+Ruqaa:700',
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
              ),
              body: Container(
                child: ScopedModelDescendant<AppModel>(
                  builder: (context, child, model) => Column(
                      children: model.items
                          .map((item) => ListTile(
                                title: Text(item.name),
                                onLongPress: () {
                                  model.deleteItem(item);
                                },
                              ))
                          .toList()),
                ),
              ))
        ],
      );
  }
}
