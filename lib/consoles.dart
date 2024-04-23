import 'package:flutter/material.dart';

class consoleProduct extends StatelessWidget{
  final String productName;
  final double price;
  final String linkImage;
  const consoleProduct({super.key, required this.productName, required this.price, required this.linkImage});


  @override
  Widget build(BuildContext context){
    return Container(
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
        color: Color.fromARGB(188, 138, 213, 226),
        borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15 , left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productName , style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.w700),),
              Text("\$$price",style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w700)),
              Center(child: Image.asset(linkImage , width: 170,)),
            ],
          ),
        ),
    );
  }
}