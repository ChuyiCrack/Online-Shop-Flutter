import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});



  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',//Here we are saying that all the Text has yhis font family is like applying font family to * in CSS
          
      ),
      home: HomePageStatefulWidget(),
    );
  }


}
