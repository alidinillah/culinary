import 'package:culinary/models/products.dart';
import 'package:flutter/material.dart';

class Cart {
  final Product product;
  int quantity;
  double price;
  Cart(this.product, this.quantity, {this.price});
  factory Cart.init(Product product) => Cart(product, 0);
  Map toMap() => {"productId": product.id, "quantity": quantity};
  Widget toRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 13.0),
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: Text(product.name),
        ),
      ],
    );
  }
}