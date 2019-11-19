import 'package:flutter/material.dart';
import 'package:azkarapp/screens/splash_screen.dart';
import 'package:azkarapp/model/add_something.dart';
import 'package:scoped_model/scoped_model.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: AppModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'azkar',
        home: SplashScreen(),
      ),
    );
  }
}