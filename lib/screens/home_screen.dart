import 'package:flutter/material.dart';
import 'package:azkarapp/screens/mornning.dart';
import 'package:azkarapp/screens/evining.dart';
import 'package:azkarapp/screens/sbha.dart';
import 'package:azkarapp/screens/salah.dart';
import 'package:azkarapp/screens/sleep.dart';
import 'package:azkarapp/add_somthing_screens/textform_field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildItem1({String text1, Tab imageIcon1}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.blue, width: 5.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Tab(
                  icon: imageIcon1,
                ),
                Text(
                  text1,
                  style: TextStyle(
                      fontFamily: 'Aref+Ruqaa:700',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildItem2({String text2, Tab imageIcon2}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.white, width: 5.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Tab(
                  icon: imageIcon2,
                ),
                Text(
                  text2,
                  style: TextStyle(
                      fontFamily: 'Aref+Ruqaa:700',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.yellowAccent, Colors.blue])),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'الرئيسيه',
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
          body: ListView(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 140.0,
                  width: 140.0,
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MorningScreen()));
                        },
                        child: buildItem1(
                          text1: 'أذكار الصباح',
                          imageIcon1: Tab(
                            icon: Image.asset('assets/images/morIcon.png'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EveningScreen()));
                        },
                        child: buildItem2(
                          text2: 'أذكار المساء',
                          imageIcon2: Tab(
                            icon: Image.asset('assets/images/evIcon.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddSomething()));
                        },
                        child: buildItem1(
                          text1: ' إضافه شئ خاص بي',
                          imageIcon1: Tab(
                            icon: Image.asset('assets/images/prayIcon.png'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SalahScreen()));
                        },
                        child: buildItem2(
                          text2: 'أذكار الصلاه',
                          imageIcon2: Tab(
                            icon: Image.asset('assets/images/salahIcon.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SleepScreen()));
                        },
                        child: buildItem1(
                          text1: 'أذكار النوم',
                          imageIcon1: Tab(
                            icon: Image.asset('assets/images/sleepIcon.png'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SbhaScreen()));
                        },
                        child: buildItem2(
                          text2: 'السبحه',
                          imageIcon2: Tab(
                            icon: Image.asset('assets/images/sbha.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
