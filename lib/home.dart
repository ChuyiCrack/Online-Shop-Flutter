library home;
import 'package:flutter/material.dart';
import 'homeWidgets.dart';
import 'shoppingCart.dart';
import 'profile.dart';



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
    profileStateful()
  ];

  int _currentPage = 0;


  void changeCurrPage(int newValue){
    setState(() {
      _currentPage = newValue;
    });
}

  @override
  void initState() {
    super.initState();
    selected = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listWidgets[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(188, 138, 213, 226),
          onTap: (value) {
            setState(() {
              print(value);
              _currentPage = value;
            });
          },
          currentIndex: _currentPage,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),

          ],
        ));
  }
}
