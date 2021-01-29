import 'package:culinary/culinary_colors.dart';
import 'package:culinary/models/products.dart';
import 'package:culinary/notifiers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItemButton extends StatelessWidget {
  final Product product;
  ProductItemButton(this.product);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (_, cn, __) {
        if(cn.quantity(product) == 0)
          return ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            height: 33,
            child: OutlineButton(
              borderSide: BorderSide(color: CulinaryColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
              ),
              onPressed: (){
                cn.addProduct(product);
              }, 
            child: Text('Tambah ke keranjang', style: TextStyle(color: CulinaryColors.primary))
            ),
          );
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonTheme(
              minWidth: 20,
              height: 33,
              child: OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                ),
                onPressed: () {
                  cn.remove(product);
                }, 
                color: Colors.grey[300],
                child: Text('-', style: TextStyle(fontSize: 20, color: CulinaryColors.primary, fontWeight: FontWeight.bold))
              ),
            ),
            SizedBox(width: 4),
            Expanded(
              child: ButtonTheme(
                height: 33,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                  onPressed: () {}, 
                  color: Colors.grey[300],
                  child: Text(cn.quantity(product).toString(), style: TextStyle(fontWeight: FontWeight.bold))
                ),
              ),
            ),
            SizedBox(width: 4),
            ButtonTheme(
              minWidth: 20,
              height: 33,
              child: OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                ),
                onPressed: () {
                  cn.addProduct(product);
                }, 
                color: Colors.grey[300],
                child: Text('+', style: TextStyle(fontSize: 20, color: CulinaryColors.primary, fontWeight: FontWeight.bold))
              ),
            ),
          ],
        );
      }
    );
  }
}