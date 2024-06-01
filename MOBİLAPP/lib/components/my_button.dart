import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function ()? onTap;//yani bu fonksiyon opsiyoneldir ve null olabilir.
  final String text;


  const MyButton({
    super.key, //Bu, üst sınıf olan Widget'in key parametresine geçiş yapar
    required this.text,
    required this.onTap,//my button için kesin olmalı
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(//içeriğini düzenlemek ve stil vermek için kullandık
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(  //konteynerin arka planını ve kenarlarını stilize eder
                color: Theme.of(context).colorScheme.secondary,//uygulama temasından alır renkleri
                borderRadius:BorderRadius.circular(8),//yuvarklak yapmak için
            ),
        child: Center(
          child: Text(
            text,//text konteyner içine ortaladık
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,//text yazı stili düzenlendi
            ),
          ),
        ),
      ),
    );
  }
}
