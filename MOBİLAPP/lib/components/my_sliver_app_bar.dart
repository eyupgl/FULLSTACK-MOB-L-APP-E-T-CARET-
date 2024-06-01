import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled1/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340.0,//app bar'ın maksimum  yüksekliğini belirtir.
      collapsedHeight: 120,//app bar'ın minimumyüksekliğini belirtir.
      floating: false,//app bar kaybolsun diye
      pinned: true,//app bar üstte sabıt kalır
      actions: [//ek işlemler
        //kart
        IconButton(
            onPressed: (){
              //sepet sayfasına git
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CartPage(),
                  ),
              );
            } ,
            icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],
      title: const Text("Gurme Fırıncı"),
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Theme.of(context).colorScheme.background,


      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0,right: 0,top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
