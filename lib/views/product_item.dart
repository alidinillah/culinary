import 'package:culinary/culinary_colors.dart';
import 'package:culinary/models/products.dart';
import 'package:culinary/views/product_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem(this.product);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: product.thumbnail != null ? Image.network(product.thumbnail) : Image.asset("assets/placeholder.png"),
                  borderRadius: BorderRadius.circular(4)
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(product.rating.toStringAsFixed(1), style: TextStyle(fontSize: 14, color: CulinaryColors.text, fontWeight: FontWeight.bold)),
                    RatingBarIndicator(
                      rating: product.rating,
                      unratedColor: Colors.black12,
                      itemBuilder: (context, i) => Icon (
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 14,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(product.name, style: TextStyle(fontSize: 14, color: CulinaryColors.title, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("by ${product.brandName}", style: TextStyle(fontSize: 12, color: CulinaryColors.text, fontWeight: FontWeight.w600), maxLines: 1),
                SizedBox(height: 8),
                Text(product.packageName, style: TextStyle(fontSize: 10, color: CulinaryColors.subtext)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(product.price), 
                        style: TextStyle(fontSize: 14, color: CulinaryColors.title, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(width: 4),
                    Text('termasuk ongkir', style: TextStyle(fontSize: 10, color: CulinaryColors.subtext))
                  ],
                ),
                SizedBox(height: 8),
                ProductItemButton(product)
              ],
            )
          ],
        ),
      ),
    );
  }
}