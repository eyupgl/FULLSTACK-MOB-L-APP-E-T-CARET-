import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/restaurant.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: const Text("Adresin.."),
          content:  const TextField(
            decoration:  InputDecoration(hintText: "Adresini Gir"),
          ),
          actions: [
            //iptal butonu
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("İptal"),
            ),
            //onay butonu
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kaydet"),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "pastaWich",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: ()=> openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurant>(
                    builder: (context, restaurant, child) => Text(
                      restaurant.deliveryAddress,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),

                //drop down menu
                Icon(Icons.keyboard_arrow_down_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
