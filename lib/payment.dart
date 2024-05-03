import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class paymentStatefull extends StatefulWidget {
  const paymentStatefull({super.key});

  @override
  State createState() {
    return paymentState();
  }
}

class paymentState extends State<paymentStatefull> {
  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      counterText: '',
      contentPadding: const EdgeInsets.only(bottom: 10),
      labelText: label,
      border: InputBorder.none,
      labelStyle: const TextStyle(fontSize: 20, height: 1),
    );
  }

  BoxDecoration boxinputDecoration() {
    return BoxDecoration(
        border: Border.all(width: 2), borderRadius: BorderRadius.circular(10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: boxinputDecoration(),
            child: TextField(
              maxLength: 16,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              decoration: inputDecoration('Credit Card Number'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 10),
                  decoration: boxinputDecoration(),
                  child: TextField(
                    decoration: inputDecoration('gg'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 20),
                  decoration: boxinputDecoration(),
                  child: TextField(
                    decoration: inputDecoration('gg'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}