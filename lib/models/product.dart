// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

class Product {
  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  Product({
    required this.available,
    required this.name,
    this.picture,
    required this.price,
    this.id,
  });

  /// Resivimos un String generamos una instancia de nuestro modelo
  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  /// Json para mandar al servidor recibe un mapa y lo pasa a json
  String toRawJson() => json.encode(toJson());

  /// Resivimos un MAPA json y lo instanciamos a el modelo
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  Product copy() => Product(
        available: this.available,
        name: this.name,
        picture: this.picture,
        price: this.price,
        id: this.id,
      );
}
