import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/components/my_button.dart';
import 'package:untitled1/models/restaurant.dart';
import '../models/cake.dart';

class CakePage extends StatefulWidget {
  final Cake cake;
  final Map<Addon, bool> selectedAddons ={};

  CakePage({
    super.key,
    required this.cake,
  }) {
  // initialize selected addons to be false
    for(Addon addon in cake.availableAddons){
      selectedAddons[addon] =false;
    }
  }

  @override
  State<CakePage> createState() => _CakePageState();
}

class _CakePageState extends State<CakePage> {
  //method to add to cart
  void addToCart(Cake cake, Map<Addon, bool>selectedAddons ){

    //close the current cake page to go  back to menu
    Navigator.pop(context);
    //format the selected addons
    List<Addon> currentlySelectedAddons=[];
    for(Addon addon in widget.cake.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(cake, currentlySelectedAddons);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //scaffold UI
      Scaffold(
        body: SingleChildScrollView(
          child: Column(

            children: [
              //cake image
              Image.asset(widget.cake.imagePath),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //cake name
                    Text(
                      widget.cake.name,
                      style: const  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    //cake price
                    Text(
                      '\₺${widget.cake.price}',
                      style:   TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    const SizedBox(height: 10),

                    //cake description
                    Text(widget.cake.description),

                    const SizedBox(height: 10),

                    Divider(color:Theme.of(context).colorScheme.secondary),

                    const SizedBox(height: 10),


                    //addons
                    Text(
                      "EKSTRA",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap:true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.cake.availableAddons.length,
                        itemBuilder: (context, index){
                          //get individual addon
                          Addon addon =widget.cake.availableAddons[index];

                          //return check box UI
                          return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle: Text(
                              '\₺${addon.price}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),

                            value: widget.selectedAddons[addon],
                            onChanged: (bool? value){
                              setState(() {
                                widget.selectedAddons[addon] =value!;
                              });
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              //button add to card
              MyButton(
                onTap: () =>addToCart(widget.cake, widget.selectedAddons),
                text: "Karta ekle",
              ),
              const SizedBox(height: 25),

            ],
          ),
        ),
      ),

      //back button
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration:
              BoxDecoration(color:  Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
    ],
    );
  }
}
