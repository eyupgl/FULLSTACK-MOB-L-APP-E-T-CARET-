//öğeler

class Cake{
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final CakeCategory category;
  List<Addon> availableAddons;

  Cake({
  required this.name,
  required this.description,
  required this.imagePath,
  required this.price,
  required this.category,
    required this.availableAddons,
});
}
 //kategoriler
enum CakeCategory{
  dilimPasta,
  Pasta,
  Ekmek,
  Tatli,
}

//ekstra özellik öğeleir
class Addon{
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}