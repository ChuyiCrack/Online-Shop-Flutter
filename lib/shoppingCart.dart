// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'globalVariables.dart';
import 'payment.dart';

class cartStatefull extends StatefulWidget {
  const cartStatefull({super.key});

  @override
  State createState() {
    return cartState();
  }
}

class cartState extends State<cartStatefull> {
  late int totalProducts;
  late double totalToPay;
  @override
  Widget build(BuildContext context) {
    totalProducts = shoppingCart.length;
    totalToPay = 0;
    for (var prduct in shoppingCart) {
      totalToPay = totalToPay + int.parse(prduct['price']);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          shoppingCart.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      itemCount: shoppingCart.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Total:",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text("\$$totalToPay",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  shoppingCart[index - 1]['image'],
                                  height: 100,
                                  width: 95,
                                ),
                                Column(
                                  children: [
                                    Text(shoppingCart[index - 1]['name']),
                                    Text(shoppingCart[index - 1]['type']),
                                    Text(
                                        '\$' + shoppingCart[index - 1]['price'])
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        shoppingCart.removeAt(index - 1);
                                      });
                                    },
                                    icon: const Icon(Icons.cancel))
                              ],
                            ),
                          );
                        }
                      }),
                )
              : const Center(
                  child: Text(
                  "Try to add something to your cart",
                  style: TextStyle(fontSize: 20),
                )),
          shoppingCart.isNotEmpty
              ? TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(253, 235, 55, 1),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const paymentStatefull();
                    }));
                  },
                  child: shoppingCart.length == 1
                      ? const Text("Go to Pay (1 product)")
                      : Text("Go to Pay ($totalProducts products)"),
                )
              : const Text('')
        ],
      ),
    );
  }
}
