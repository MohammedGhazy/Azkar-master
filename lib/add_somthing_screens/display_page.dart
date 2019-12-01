import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:azkarapp/model/add_something.dart';

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
                  'الأدعيه والأحاديث الخاصه بي',
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
                  builder: (context, child, model) => ListView(
                      children: model.items
                          .map((item) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10.0),
                              //border: Border.all(color: Colors.limeAccent, width: 5.0),
                        ),
                        child: ListTile(
                              title: Text(item.name),
                              onLongPress: () {
                                model.deleteItem(item);
                              },
                        ),
                                  ),
                            ),
                          ))
                          .toList()),
                ),
              ))
        ],
      );
  }
}
