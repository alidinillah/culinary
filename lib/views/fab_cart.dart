import 'package:culinary/notifiers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:culinary/views/cart_page.dart';

class FabCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (_, cart, __) {
        return Consumer<CartNotifier>(
          builder: (_, cn, __) => cn.carts.isEmpty
            ? Container()
              : FloatingActionButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${cn.total} Item | " + NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(cn.totalPrice(cart.carts)), style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("Termasuk ongkos kirim", style: TextStyle(fontSize: 12))
                          ],
                        ),
                        Icon(Icons.shopping_cart, color: Colors.white)
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => CartPage()));
                    // if (user == null || !user.login) {
                    //   Navigator.popUntil(context, ModalRoute.withName('/'));
                    //   notifier.status = AuthStatus.Authenticating;
                    // } else {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (ctx) => CheckoutGrosir()),
                    //   );
                    // }
                  }),
        );

      });
  }
}
