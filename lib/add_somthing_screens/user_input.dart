import 'package:flutter/material.dart';
import 'package:azkarapp/model/my_model.dart';
import 'package:azkarapp/model/database.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<User>> users;
  String _userText;
  bool isUpdate = false;
  int userIdForUpdate;
  DBHelper dbHelper;
  final _userTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshStudentList();
  }

  refreshStudentList() {
    setState(() {
      users = dbHelper.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [Colors.pinkAccent, Colors.greenAccent])),
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
                  color: Colors.amber),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: <Widget>[
              Form(
                key: _formStateKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        maxLength: 50,
                        maxLines: 3,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'من فضلك لا تتركها فارغه';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userText = value;
                        },
                        controller: _userTextController,
                        decoration: InputDecoration(
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.purple,
                                    width: 4,
                                    style: BorderStyle.solid)),
                            // hintText: "Student Name",
                            hintText: "أدخل ما تريده",
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.purple,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.purple,
                    child: Text(
                      (isUpdate ? 'تحديث' : 'إضافه'),
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (isUpdate) {
                        if (_formStateKey.currentState.validate()) {
                          _formStateKey.currentState.save();
                          dbHelper
                              .update(User(userIdForUpdate, _userText))
                              .then((data) {
                            setState(() {
                              isUpdate = false;
                            });
                          });
                        }
                      } else {
                        if (_formStateKey.currentState.validate()) {
                          _formStateKey.currentState.save();
                          dbHelper.add(User(null, _userText));
                        }
                      }
                      _userTextController.text = '';
                      refreshStudentList();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text(
                      (isUpdate ? 'الغاء التحديث' : 'مسح'),
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _userTextController.text = '';
                      setState(() {
                        isUpdate = false;
                        userIdForUpdate = null;
                      });
                    },
                  ),
                ],
              ),
              const Divider(
                height: 5.0,
              ),
              Expanded(
                child: FutureBuilder(
                  future: users,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return generateList(snapshot.data);
                    }
                    if (snapshot.data == null || snapshot.data.length == 0) {
                      return Text('لا يوجد شئ');
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
  SingleChildScrollView generateList(List<User> users) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: DataTable(
              sortColumnIndex: 0,
                sortAscending: true,
                dataRowHeight: 120.0,
                headingRowHeight: 40.0,

                columns: [
                  DataColumn(
                    label: Text('ما أدخلته',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                  ),
                  DataColumn(
                    label: Text('حذف',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                  )
                ],
                rows: users
                    .map(
                      (user) => DataRow(
                        cells: [
                          DataCell(
                            Text(user.name),
                            onTap: () {
                              setState(() {
                                isUpdate = true;
                                userIdForUpdate = user.id;
                              });
                              _userTextController.text = user.name;
                            },
                          ),
                          DataCell(
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                dbHelper.delete(user.id);
                                refreshStudentList();
                              },
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
          ),
        ),
      ),
    );
  }
}
