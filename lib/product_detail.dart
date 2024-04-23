import 'package:flutter/material.dart';

class ProductoDetail extends StatefulWidget {
  const ProductoDetail({super.key});

  @override
  State createState(){
    return ProductDetailState();
  }
}

class ProductDetailState extends State{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Text('Test'),
    );
  }
}

