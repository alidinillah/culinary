import 'package:culinary/culinary_colors.dart';
import 'package:culinary/views/product_list.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            ProductList()), (Route<dynamic> route) => false),
        ),
        elevation: 0,
        title: Text("Review Pesanan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/empty_state.PNG", width: 200),
            SizedBox(height: 32),
            Text("Keranjangmu masih kosong, nih", style: TextStyle(color: CulinaryColors.title, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text("Pesan makanan kesukaan kamu sekarang dan prosesnya akan muncul di sini.", style: TextStyle(color: CulinaryColors.subtext, fontSize: 13), textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}