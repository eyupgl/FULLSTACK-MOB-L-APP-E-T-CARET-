import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:untitled1/components/my_button.dart';

import 'delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  String cardNumber ='';
  String expiryDate ='';
  String cardHolderName ='';
  String cvvCode='';
  bool isCvvFocused =false;

  //user wants to pay
  void userTappedPay(){
    if(formKey.currentState!.validate()){
      //only show dialog if form is vaid
      showDialog(
        context: context,
        builder: (context) =>AlertDialog(
          title: const Text("Ödemeyi Onayla"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Kart numarası : $cardNumber" ),
                Text("Son Kullanma Tarihi : $expiryDate" ),
                Text("Kart tutucu numarası : $cardHolderName" ),
                Text("CVV : $cvvCode" ),
              ],
            ),
          ),
          actions: [
            //cancel button
                TextButton(
                  onPressed: ()=> Navigator.pop(context),
                    child:  const Text("İptal"),
                ),

            //yes button
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => DeliveryProgressPage(),
                ),
              );
            },
              child:  const Text("Evet"),
            )



          ],
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Çıkış yapmak"),
      ),

      body: Column(
        children: [
          //credit cart
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
          ),

          //credit cart form
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange:(data) {
                setState(() {
                  cardNumber =data.cardNumber;
                  expiryDate= data.expiryDate;
                  cardHolderName=data.cardHolderName;
                  cvvCode=data.cvvCode;
                });
              } ,
              formKey: formKey,
          ),
          const Spacer(),

          MyButton(
              onTap: userTappedPay ,
              text: "Şimdi öde" ,
          ),

          const SizedBox(height: 25),

       ],
      ),
    );
  }
}
