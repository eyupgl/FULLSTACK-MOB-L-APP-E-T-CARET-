import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/components/my_button.dart';
import 'package:untitled1/components/my_cart_tile.dart';
import 'package:untitled1/models/restaurant.dart';
import 'package:untitled1/pages/payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child){
      //cart
      final userCart = restaurant.cart;

      //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Kart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart button
              IconButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                            "Sepeti temizlemek istediğinizden emin misiniz?"),
                        actions: [
                          //cancel button
                          TextButton(
                              onPressed: ()=>Navigator.pop(context),
                              child:const Text("İPTAL"),
                            ),
                          //yes button
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: const Text("EVET"),
                          ),


                        ],
                      ),
                    );
                  } ,
                  icon: const Icon(Icons.delete),
              )


            ],
          ),
          body: Column(
            children: [

              //list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                          child: Center(
                              child: Text("KART BOŞ.."),
                          ),
                    )
                        : Expanded(
                        child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              //get individual cart item
                              final cartItem = userCart[index];
                
                              //return cart tile UI
                              return MyCartTile(cartItem: cartItem);
                            } ,
                    ),
                ),
                ],
                ),
              ),

              //button to pay
              MyButton(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentPage(),
                      ),
                  ),
                  text: "Ödeme sayfasına git" ,
              ),

              const SizedBox(height: 25),
            ],
          ),
        );
    },
    );
  }
}
