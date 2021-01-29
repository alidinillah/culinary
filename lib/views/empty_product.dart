import 'package:flutter/material.dart';

class EmptyProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/empty_product.png'),
            SizedBox(height: 32),
            Text('Belum Ada Produk', style: TextStyle(color: Color(0XFF4F4F4F), fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Periksa kembali produk Anda', style: TextStyle(color: Color(0XFF4F4F4F), fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
