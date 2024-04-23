import 'package:flutter/material.dart';
import 'package:online_shop/catalog.dart';
import 'consoles.dart';

class HomePageStatefulWidget extends StatefulWidget{
   const HomePageStatefulWidget({super.key});

  @override
  State<HomePageStatefulWidget> createState() => HomePageStatelessWidgetState();
}

class HomePageStatelessWidgetState extends State<HomePageStatefulWidget> {
  final List<String> filters = const [
    'All',
    'Sony',
    'Microsoft',
    'Nintendo',
  ];

  late String selected;

  @override
  void initState(){
    super.initState();
    selected = filters[0];

  }

  OutlineInputBorder borderSearch(){
    return const OutlineInputBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , bottomLeft:Radius.circular(20)),
      borderSide:BorderSide(width: 2 ,
      color: Color.fromARGB(255, 82, 82, 82))

    );
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Console \nCollection" , style: TextStyle(fontWeight:FontWeight.w600 , fontSize: 25),),
                ),
                Expanded(child: TextField(decoration: InputDecoration(hintText: 'Search' , hintStyle: const TextStyle(fontWeight: FontWeight.w600) ,prefixIcon: const Icon(Icons.search , size: 18,),enabledBorder:borderSearch(),focusedBorder: borderSearch()))), //What does Expanded do its say to the widget take the most space that it can take
              ],
            ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index){
                return Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = filters[index];
                      });
                    },
                    child: Chip(
                      backgroundColor: selected == filters[index] ? const Color.fromARGB(166, 224, 224, 224) : const Color.fromARGB(166, 255, 255, 255) ,
                      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
                      label: Text(filters[index],
                      style: const TextStyle(fontSize: 18),),),
                  ),
                );
            },
            ),
          ),
           Expanded(
            child: ListView.builder(
              itemCount: catalog.length,
              itemBuilder: (context , index){
                return consoleProduct(
                  productName: catalog[index]['name'] as String,
                 price:catalog[index]['price'].toDouble(),
                 linkImage:catalog[index]['imageLink'] as String,
                 );
            }
            ),

          )
          ],
        ),
      )
    );
  }
}