import 'package:flutter/material.dart';
import 'package:online_shop/catalog.dart';
import 'consoles.dart';
import 'product_detail.dart';
import 'homeWidgets.dart';
import 'shoppingCart.dart';

class HomePageStatefulWidget extends StatefulWidget {
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

  List listWidgets = const [
    homeWidget(),
    cartStatefull(),
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selected = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listWidgets[currentPage],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(188, 138, 213, 226),
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '')
          ],
        ));
  }
}
