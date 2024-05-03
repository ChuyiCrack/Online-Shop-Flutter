import 'package:flutter/material.dart';
import 'catalog.dart';
import 'product_detail.dart';
import 'consoles.dart';

class homeWidget extends StatefulWidget {
  const homeWidget({super.key});

  @override
  State<homeWidget> createState() => homeWidgetState();
}

class homeWidgetState extends State<homeWidget> {
  OutlineInputBorder borderSearch() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        borderSide:
            BorderSide(width: 2, color: Color.fromARGB(255, 82, 82, 82)));
  }

  final List<String> filters = const [
    'All',
    'Sony',
    'Microsoft',
    'Nintendo',
  ];

  late String selected;

  late List consolesFilter;

  @override
  void initState() {
    super.initState();
    selected = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    consolesFilter = [];
    for (var console in catalog) {
      if ((console['company'] == selected) || (selected == 'All')) {
        consolesFilter.add(console);
      }
    }
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Console \nCollection",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w600),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 18,
                          ),
                          enabledBorder: borderSearch(),
                          focusedBorder:
                              borderSearch()))), //What does Expanded do its say to the widget take the most space that it can take
            ],
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = filters[index];
                      });
                    },
                    child: Chip(
                      backgroundColor: selected == filters[index]
                          ? const Color.fromARGB(166, 224, 224, 224)
                          : const Color.fromARGB(166, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      label: Text(
                        filters[index],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: consolesFilter.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductoDetail(
                          console: consolesFilter[index],
                        );
                      }));
                    },
                    child: consoleProduct(
                      productName: consolesFilter[index]['name'] as String,
                      price: consolesFilter[index]['price'].toDouble(),
                      linkImage: consolesFilter[index]['imageLink'] as String,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
