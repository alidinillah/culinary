import 'package:culinary/culinary_colors.dart';
import 'package:culinary/notifiers/cart_notifier.dart';
import 'package:culinary/views/empty_state.dart';
import 'package:culinary/views/fab_checkout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:culinary/views/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var now = DateTime.now();
  var formatter = DateFormat.yMMMMEEEEd('id');
  String date = formatter.format(now);
    return Consumer<CartNotifier> (
      builder: (_, cn, __) {
        if(cn.carts.isEmpty)
          return EmptyState();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 1.0,
            title: Text("Review Pesanan"),
          ),
          body: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Daftar Pesanan", style: TextStyle(fontSize: 16, color: CulinaryColors.title, fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0)
                                  ),
                                  child: Container(
                                    height: 231,
                                    width: 328,
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          SizedBox(height: 10.0),
                                          Column(
                                            children: <Widget>[
                                              Text('Hapus Pesanan', style: TextStyle(fontSize: 16, color: CulinaryColors.text, fontWeight: FontWeight.w600)),
                                              SizedBox(height: 16.0),
                                              Text('Apakah kamu yakin ingin menghapus pesanan?', style: TextStyle(fontSize: 13, color: CulinaryColors.subtext), textAlign: TextAlign.center,),
                                            ],
                                          ),
                                          SizedBox(height: 32.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              FlatButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4.0)                      
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                }, 
                                                child: Text(
                                                  'Batalkan',
                                                  style: TextStyle(color: Colors.grey, fontSize: 14),
                                                ),
                                              ),
                                              FlatButton(
                                                color: CulinaryColors.primary,
                                                onPressed: () {
                                                  cn.cleanProduct();
                                                  Navigator.push(context, MaterialPageRoute(
                                                    builder: (_) => EmptyState()));
                                                }, 
                                                child: Text(
                                                  'Ya, Hapus',
                                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              );
                              }
                            );
                      } ,
                      child: Text("Hapus Pesanan", style: TextStyle(fontSize: 16, color: CulinaryColors.subtext, fontWeight: FontWeight.bold))
                    )
                  ],
                ),
              ),
              SizedBox(height: 18),
              Text(date, style: TextStyle(fontSize: 16, color: CulinaryColors.text, fontWeight: FontWeight.w700)),
              SizedBox(height: 24),
              ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    separatorBuilder: (_, __) => Divider(height: 40), 
                    itemCount: cn.carts.length,
                    itemBuilder: (_, i) => CartItem(cn.carts[i].product)
                  )
            ],
          ),
          
          floatingActionButton: Container(
            width: 380,
            height: 52,
            child: FabCheckout()),
        );
      }
    );
  }
}