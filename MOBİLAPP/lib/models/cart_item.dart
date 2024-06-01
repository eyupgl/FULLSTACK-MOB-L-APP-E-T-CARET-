import 'cake.dart';

class CartItem{
  Cake cake;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.cake,
    required this.selectedAddons,
    this.quantity=1,
});

  double get totalPrice{
    double addonsPrice =
      selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return(cake.price+ addonsPrice)*quantity;
  }
}