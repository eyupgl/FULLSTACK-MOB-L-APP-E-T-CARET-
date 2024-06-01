import 'package:flutter/material.dart';

import '../models/cake.dart';

class CakeTile extends StatelessWidget {

  final Cake cake;
  final void Function()? onTap;

  const CakeTile({
    super.key,
    required this.cake,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(//kullanıcı etkileşimlerini algılamak için kullanılır
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                //pasta detayları kısmı
                Expanded(//wideget içinde oldugu kadar yer almasını sağlar
                    child: Column(//widget'ları dikey olarak yerleştiren bir widget'tır
                      crossAxisAlignment: CrossAxisAlignment.start,//çocuk widget'ların sol tarafa hizalanması sağlanır.
                      children: [
                        Text(cake.name),
                        Text(
                          '\₺'+cake.price.toString(),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                            cake.description,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ],
                    ),
                ),
                  const SizedBox(width: 15),

                //resim
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                    child: Image.asset(cake.imagePath,height: 120,width: 160),
                ),
              ],
            ),
          ),
        ),
        //divider line
         Divider(//bölmek için bir çizgidir
          color: Theme.of(context).colorScheme.tertiary,
           endIndent: 25,
           indent: 25,
        )
      ],
    );
  }
}
