import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/components/my_quantity_selector.dart';
import 'package:untitled1/models/restaurant.dart';

import '../models/cart_item.dart';

class MyCartTile extends StatelessWidget {
  final CartItem  cartItem;//sepet öğesini

  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context , restaurant , child) =>Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //pasta resim
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                        cartItem.cake.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),

                  const SizedBox(width: 10 ),


                  //isim fiyat
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //psata name
                      Text(cartItem.cake.name),


                      //pasta fiyat

                      Text(
                        '\₺' + cartItem.cake.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      ),

                      const SizedBox(height: 10),
                      //miktar artma azaltma
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        cake: cartItem.cake,
                        onDecrement: (){//azatlma
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement:(){
                          restaurant.addToCart(//arttırma
                              cartItem.cake, cartItem.selectedAddons);
                        },
                      )

                    ],
                  ),



                ],
              ),
            ),

            //eksta kısmı
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                             label: Row(
                                children: [
                                    //eksra adı
                                  Text(addon.name),

                                     //ekstra fiyat
                                      Text('(\₺${addon.price})'),
                                   ],
                                 ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary)),
                          onSelected:(value) {},
                          backgroundColor:
                          Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                )
                    .toList(),//dizi oluşturmak için kullanıyoruz
              ),
            ),

          ],
        ),
      ),
    );
  }
}
