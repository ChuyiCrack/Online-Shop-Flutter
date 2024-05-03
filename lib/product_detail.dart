import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'globalVariables.dart';

class ProductoDetail extends StatefulWidget {
  final Map<String, dynamic> console;
  const ProductoDetail({super.key, required this.console});

  @override
  State createState() {
    return ProductDetailState();
  }
}

class ProductDetailState extends State<ProductoDetail> {
  String? typeSelected;
  bool addedCart = false;
  late String price;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = widget.console['price'].toString();
  }

  @override
  Widget build(BuildContext context) {
    final String consoleName = widget.console['name'];
    final String linkImage = widget.console['imageLink'];
    final List<List<dynamic>> optionsConsole = widget.console['types'];
    late Map<String, dynamic> productAdded;

    ElevatedButton addcartButton(bool added) {
      return ElevatedButton(
          style: TextButton.styleFrom(
              backgroundColor: !added
                  ? const Color.fromRGBO(253, 235, 55, 1)
                  : const Color.fromRGBO(172, 161, 37, 1),
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(25)))),
          onPressed: !added
              ? () {
                  if (typeSelected == null) {
                    print('Some Alert will show');
                  } else {
                    productAdded = {
                      'name': consoleName,
                      'price': price,
                      'image': linkImage,
                      'type': typeSelected
                    };
                    setState(() {
                      shoppingCart.add(productAdded);
                      addedCart = true;
                    });
                  }
                }
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                !added ? Icons.shopping_cart : Icons.check,
                color: Colors.black,
                size: 22,
              ),
              Text(
                !added ? "Add to cart" : "Added",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.black),
              ),
            ],
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Description",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(154, 0, 0, 0),
              fontSize: 17),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              consoleName,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
            const Spacer(
              flex: 1,
            ), //This will take all the remaining space depending of the flex
            Image.asset(
              linkImage,
              height: 400,
            ),
            const Spacer(
              flex: 3,
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                width: double.infinity,
                color: const Color.fromARGB(68, 234, 234, 234),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$$price',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: optionsConsole.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    typeSelected = optionsConsole[index][0];
                                    price = (widget.console['price'] +
                                            optionsConsole[index][1])
                                        .toString();
                                    print(widget.console['price'] +
                                        optionsConsole[index][1]);
                                  });
                                },
                                child: Chip(
                                  backgroundColor: typeSelected ==
                                          optionsConsole[index][0]
                                      ? const Color.fromARGB(255, 225, 225, 225)
                                      : const Color.fromARGB(
                                          255, 255, 254, 254),
                                  label: Text(optionsConsole[index][0]),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: addcartButton(addedCart),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
