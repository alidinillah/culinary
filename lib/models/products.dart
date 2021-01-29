import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Product{
  final int id;
  final String name;
  final String thumbnail;
  final String brandName;
  final String packageName;
  final int price;
  final double rating;

  Product(
    this.id,
    this.name,
    this.thumbnail,
    this.brandName,
    this.packageName,
    this.price,
    this.rating
  );

  factory Product.fromMap(Map map){
    return Product(map["id"], map["name"], map["image_url"], map["brand_name"], map["package_name"], map["price"], map["rating"]);
  }

  Widget imageSize(double size) {
    String imagePath = "assets/placeholder.png";
    Image image = Image.asset(
      imagePath,
      width: size,
      height: size,
    );
    return image == null
      ? image
        : CachedNetworkImage(
            imageUrl: thumbnail,
            placeholder: (_, __) => image,
            width: size,
            height: size,
          );
  }

  Widget get image {
    String imagePath = "assets/images/placeholder.png";
    Image image = Image.asset(imagePath);
    return thumbnail == null
      ? image
        : CachedNetworkImage(
            imageUrl: thumbnail,
            placeholder: (_, __) => image,
          );
  }
}