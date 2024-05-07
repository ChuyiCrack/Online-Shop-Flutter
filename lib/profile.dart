import 'package:flutter/material.dart';
import 'globalVariables.dart';

class profileStateful extends StatefulWidget {
  const profileStateful({super.key});

  @override
  State createState(){
    return profileState();
  }
}


class profileState extends State<profileStateful>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Heloooo')
        ],),
      )
      );
  }
}

