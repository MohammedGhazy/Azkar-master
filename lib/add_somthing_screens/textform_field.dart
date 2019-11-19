import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:azkarapp/model/add_something.dart';
import 'package:azkarapp/add_somthing_screens/display_page.dart';

class AddSomething extends StatefulWidget {
  @override
  _AddSomethingState createState() => _AddSomethingState();
}

class _AddSomethingState extends State<AddSomething> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.pink, Colors.greenAccent])),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'إضافه نص تحبه',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Aref+Ruqaa:700',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
              ),
              body: Center(
                  child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: TextField(
                        controller: controller,
                        maxLength: 200,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.greenAccent)),
                        ),
                      ),
                    ),
                  ),
                  ScopedModelDescendant<AppModel>(
                    builder: (context, child, model) => RaisedButton(
                      child: Text('إضافه'),
                      onPressed: () {
                        Item item = Item(controller.text);
                        model.addItem(item);
                        setState(() => controller.text = '');
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text('Display Page'),
                    onPressed: () {
                    Navigator
                        .of(context)
                        .push(MaterialPageRoute(builder: (context) => DisplayPage()));
                    },
                  )
                ],
              )),
            ),
          ],
        );
  }
}
