import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'globalVariables.dart';
import 'profile.dart';
import 'home.dart';

class paymentStatefull extends StatefulWidget {
  const paymentStatefull({super.key});

  @override
  State createState() {
    return paymentState();
  }
}

class paymentState extends State<paymentStatefull> {
  InputDecoration inputDecoration(String label, IconData selectedIcon , String? linkImage) {
    return InputDecoration(
      counterText: '',
      contentPadding: const EdgeInsets.only(bottom: 10),
      labelText: label,
      border: InputBorder.none,
      labelStyle: const TextStyle(fontSize: 20, height: 1),
      prefixIcon: Icon(selectedIcon),
      suffixIcon: linkImage != null ? Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Image.asset(linkImage , width: 25,),
      ) : const Text('')
    );
  }

  BoxDecoration boxinputDecoration() {
    return BoxDecoration(
        border: Border.all(width: 2), borderRadius: BorderRadius.circular(10));
  }

  TextEditingController numberCardController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  String? cardLogo;
  bool saveCard = false;

  final GlobalKey<HomePageStatelessWidgetState> _homePage = GlobalKey<HomePageStatelessWidgetState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Add yourt Credit Card Information' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600),),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
            decoration: boxinputDecoration(),
            child: TextField(
              controller: ownerNameController,
              maxLength: 35,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
              ],
              decoration: inputDecoration('Owner Name' , Icons.person , null),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20 , left: 20 , bottom: 15),
            decoration: boxinputDecoration(),
            child: TextField(
              controller: numberCardController,
              onChanged: (value) {
               setState(() {
                 if(value.isNotEmpty){
                if(value[0] == '4'){
                  cardLogo = 'assets/images/visa.png';
                }
                else if(value[0] == '5'){
                  cardLogo = 'assets/images/mastercard.png';
                }
                else if(value.length >= 2  && value.substring(0,2) == '37'){
                  cardLogo = 'assets/images/american.png';
                }
                else{
                  cardLogo = null;
                }
               }
               else if(value.isEmpty){
                  cardLogo = null;
               } 
               });
              },
              
              maxLength: 16,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              decoration: inputDecoration('Credit Card Number' , Icons.credit_card , cardLogo),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                margin: const EdgeInsets.only(left: 20, right: 10),
                decoration: boxinputDecoration(),
                child: Row(
                  children: [
                    Expanded(
                      child:TextField(
                        keyboardType:TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        controller: monthController,
                        maxLength: 2,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'MM',
                            counterText: ''),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text(
                      '/',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: TextField(
                        controller: yearController,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'YYYY',
                            counterText: ''),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 20),
                  decoration: boxinputDecoration(),
                  child: TextField(
                    controller: cvvController,
                    textAlign: TextAlign.center,
                    maxLength: 4,
                    decoration: inputDecoration('CVV' , Icons.lock, null),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Checkbox(
                        value: saveCard,
                        onChanged:(value){
                          setState(() {
                            saveCard = value!;
                          });
                        },),
                      ),
                      const Text('Save Card')
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 245, 222, 19),
                      shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      side: const BorderSide(width: 1.5 , color: Colors.black)      
                    ),
                    onPressed: (){
                      if(ownerNameController.text.isEmpty || numberCardController.text.isEmpty || yearController.text.isEmpty || monthController.text.isEmpty ||  cvvController.text.isEmpty || cardLogo == null){
                        print('Some allert will show');
                      }
                      else{
                        Map<String,String> cardInf = {
                          'owner':ownerNameController.text,
                          'numberCard': numberCardController.text,
                          'expirationDate': monthController.text+ '/'+ yearController.text ,
                          'cvv' : cvvController.text
                        };
                        if(saveCard){
                          savedCards.add(cardInf);
                        }
                        Navigator.of(context).pop();
                        
                        }
                      },
                    child: const Text('Pay' , style: TextStyle(fontWeight: FontWeight.w600),)),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
