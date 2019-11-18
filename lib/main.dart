import 'package:flutter/material.dart';
import 'package:azkarapp/screens/splash_screen.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'azkar',
      home: SplashScreen(),
    );
  }
}