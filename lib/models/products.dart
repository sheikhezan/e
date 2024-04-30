import 'dart:ffi';

class Product {
  final int id;
  final String name;
  final String category;
  final String image;
  final String discription;
  final double price;
  late final quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.discription,
    required this.image,
    required this.price,
    required this.quantity,
});

}