import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/models/cart_item.dart';

import 'cake.dart';

class Restaurant extends ChangeNotifier{
  //liste
  final List<Cake> _menu=[
    //Dilim Pasta
    Cake(
      name: "Mozaik Dilim Pasta",
      description: "Dilim Pasta",
      imagePath: "lib/images/cake/mozaik.jpg",
      price: 90,
      category: CakeCategory.dilimPasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 10),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Redvelved Dilim Pasta",
      description: "Dilim Pasta",
      imagePath: "lib/images/cake/redvelved.jpg",
      price: 90,
      category: CakeCategory.dilimPasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 10),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Mois Dilim Pasta",
      description: "Dilim Pasta",
      imagePath: "lib/images/cake/moist.jpg",
      price: 90,
      category: CakeCategory.dilimPasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 10),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Uludag Dilim Pasta",
      description: "Dilim Pasta",
      imagePath: "lib/images/cake/uludagprofiterol.jpg",
      price: 90,
      category: CakeCategory.dilimPasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 10),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),

    // Pasta
    Cake(
      name: "Babarovski Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/babarovski.jpg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Çikolatalı Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/çikolatap.jpg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Fıstıklı Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/fıstıklı.jpeg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Karaorman Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/karaorman.jpeg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Meyveli Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/meyvelip.jpeg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Mois Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/mois.jpeg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Muz Çikolatalı Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/muzçikolata.jpeg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Newyork Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/newyork.jpeg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Oreo Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/oreo.jpg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),
    Cake(
      name: "Profiterol Pasta",
      description: "Pasta",
      imagePath: "lib/images/cake/profiterol.jpeg",
      price: 350,
      category: CakeCategory.Pasta,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 15),
        Addon(name: "Ekstra Mum", price: 10),
      ],
    ),

    //Tatli
    Cake(
      name: "Fıstıklı Ekler",
      description: "Tatli",
      imagePath: "lib/images/sweet/antep.jpeg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),
    Cake(
      name: "Hindistan cevizli Ekler",
      description: "Tatli",
      imagePath: "lib/images/sweet/hindistan.jpeg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Extra chocolate", price: 8),
      ],
    ),
    Cake(
      name: "Klasik Çikolatalı Ekler",
      description: "Tatli",
      imagePath: "lib/images/sweet/klasik.jpeg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),
    Cake(
      name: "Klasik Beyaz Çikolatalı Ekler",
      description: "Tatli",
      imagePath: "lib/images/sweet/klasikbeyaz.jpeg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),
    Cake(
      name: "Limonlu Ekler",
      description: "Tatli",
      imagePath: "lib/images/sweet/limon.jpeg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),
    Cake(
      name: "Cheescake",
      description: "Tatli",
      imagePath: "lib/images/sweet/cheescake.jpg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),
    Cake(
      name: "Lotus Kek ",
      description: "Tatli",
      imagePath: "lib/images/sweet/çikolatatp.jpg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),
    Cake(
      name: "Lotus Çıkolatalı Kek ",
      description: "Tatli",
      imagePath: "lib/images/sweet/dc09e1ee-d939-4574-aabb-d4379b15b3b8.jpg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),
    Cake(
      name: "Krunch",
      description: "Tatli",
      imagePath: "lib/images/sweet/krunch.jpg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),
    Cake(
      name: "Tartalet",
      description: "Tatli",
      imagePath: "lib/images/sweet/tartolet.jpg",
      price: 290,
      category: CakeCategory.Tatli,
      availableAddons: [
        Addon(name: "Ekstra Çikolata", price: 8),
      ],
    ),


    //Ekmek
    Cake(
      name: "Odun Ekmek",
      description: "Ekmek",
      imagePath: "lib/images/bread/ekmek.jpeg",
      price: 10,
      category: CakeCategory.Ekmek,
      availableAddons: [
        Addon(name: "Ekstra Susam", price: 1),
      ],
    ),
    Cake(
      name: "Çavdar Ekmek",
      description: "Ekmek",
      imagePath: "lib/images/bread/cavdar.jpg",
      price: 15,
      category: CakeCategory.Ekmek,
      availableAddons: [
        Addon(name: "Ekstra Susam", price: 1),
      ],
    ),
    Cake(
      name: "Papatya Ekmek",
      description: "Ekmek",
      imagePath: "lib/images/bread/papatya.jpg",
      price: 10,
      category: CakeCategory.Ekmek,
      availableAddons: [
        Addon(name: "Ekstra Susam", price: 1),
      ],
    ),
    Cake(
      name: "Kepek Ekmek",
      description: "Ekmek",
      imagePath: "lib/images/bread/kepek.jpg",
      price: 10,
      category: CakeCategory.Ekmek,
      availableAddons: [
        Addon(name: "Ekstra Susam", price: 1),
      ],
    ),
    Cake(
      name: "Tam Buğday Ekmek",
      description: "Ekmek",
      imagePath: "lib/images/bread/tambugday.jpg",
      price: 20,
      category: CakeCategory.Ekmek,
      availableAddons: [
        Addon(name: "Ekstra Susam", price: 1),
      ],
    ),
    Cake(
      name: "Çörek Ekmek",
      description: "Ekmek",
      imagePath: "lib/images/bread/çörek.jpg",
      price: 20,
      category: CakeCategory.Ekmek,
      availableAddons: [
        Addon(name: "Ekstra Susam", price: 3),
      ],
    ),
    Cake(
      name: "Ramazan Pidesi",
      description: "Ekmek",
      imagePath: "lib/images/bread/ramazanpide.jpg",
      price: 25,
      category: CakeCategory.Ekmek,
      availableAddons: [
        Addon(name: "Ekstra Yumurta", price: 5),
      ],
    ),


  ];

  //kullanıcı sepeti
  final List<CartItem> _cart =[];

  //teslimat adresi
  String _deliveryAddress='99 Hollywood Blv';

  List<Cake> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress=>_deliveryAddress;




  //Sepete ekle
  void addToCart(Cake cake,List<Addon> selectedAddons) {
    //aynı pastaya ve seçilen eklentilere sahip başka ürün var mı ?
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //Pasta malzemelerinin aynı olup olmadığını kontrol edin
      bool isSameCake =item.cake==cake;
      //seçilen eklentilerin listesinin aynı olup olmadığını kontrol edin
      bool isSameAddons =
      ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameCake&& isSameAddons;
    });
    // belirli bir kek ve seçili eklentilere sahip bir öğenin alışveriş sepetine eklenip eklenmediğini kontrol eder.


    //Ürün zaten mevcutsa miktarını artırın
    if (cartItem!= null){
      cartItem.quantity++;
    }
    //aksi takdirde sepete yeni bir sepet öğesi ekleyin
    else{
      _cart.add(CartItem(
          cake: cake,
          selectedAddons: selectedAddons,
      ),
      );
    }
    notifyListeners();

  }

  //sepetten kaldır
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      if(_cart[cartIndex].quantity >1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //sepetin toplam fiyatını al
  double getTotalPrice(){
    double total =0.0;

    for (CartItem cartItem in _cart){
      double itemTotal = cartItem.cake.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal +=addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //sepetteki toplam ürün sayısını al
  int getTotalItemCount(){
    int totalItemCount=0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //sepeti temizle

void clearCart(){
    _cart.clear();
    notifyListeners();
}


  //teslimat adresini güncelle
  void  updateDeliveryAddress(String newAddress){
    _deliveryAddress =newAddress;
    notifyListeners();
  }






  //makbuz oluşturmak
  String displayCartReceipt(){
    final receipt =StringBuffer();
    receipt.writeln("İşte makbuzunuz.");
    receipt.writeln();


    String formattedDate =
      DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("--------");

    for (final cartItem in _cart){
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.cake.name} - ${_formatPrice(cartItem.cake.price)} ");
      if (cartItem.selectedAddons.isNotEmpty){
        receipt.writeln(" Eklentiler: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("-----------");
    receipt.writeln();
    receipt.writeln("Tüm Ürünler: ${getTotalItemCount()} ");
    receipt.writeln("Toplam Fiyat: ${_formatPrice(getTotalPrice())} ");

       return receipt.toString();
  }

  //çift değeri paraya dönüştür
  String _formatPrice (double price){
    return "\₺ ${price.toStringAsFixed(2)}";
  }



  String _formatAddons(List<Addon> addons){
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join();
  }

}
