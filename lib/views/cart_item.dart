import 'package:culinary/culinary_colors.dart';
import 'package:culinary/models/products.dart';
import 'package:culinary/views/product_item_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartItem extends StatelessWidget {
  final Product product;
  CartItem(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 98,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: product.thumbnail != null ? NetworkImage(product.thumbnail) : AssetImage("assets/placeholder.png"),
                    fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(4)
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 98,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.name, maxLines: 2, style: TextStyle(fontSize: 16, color: CulinaryColors.title, fontWeight: FontWeight.bold)),
                          Icon(Icons.delete, color: CulinaryColors.subtext, size: 20)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(product.name, maxLines: 2, style: TextStyle(fontSize: 12, color: CulinaryColors.subtext)),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(product.price),
                              style: TextStyle(fontSize: 16, color: CulinaryColors.text, fontWeight: FontWeight.w700)
                          ),
                          SizedBox(width: 40),
                          Expanded(child: ProductItemButton(product))
                          // Consumer<CartNotifier>(
                          //   builder: (_, cn, __) {
                          //       return Container(
                          //         child: Row(
                          //           children: [
                          //             InkWell(
                          //               child: Icon(Icons.remove),
                          //               onTap: null,
                          //             ),
                          //             InkWell(
                          //               child: Text(cn.quantity(product).toString()),
                          //             ),
                          //             InkWell(
                          //               child: Icon(Icons.add),
                          //               onTap: cn.addProduct(product)
                          //             ),
                          //           ],
                          //         ),
                          //       );
                          //   }
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
  }
}