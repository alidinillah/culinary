import 'package:culinary/culinary_colors.dart';
import 'package:culinary/models/products.dart';
import 'package:culinary/services/product_service.dart';
import 'package:culinary/views/empty_product.dart';
import 'package:culinary/views/fab_cart.dart';
import 'package:culinary/views/product_item.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var now = DateTime.now();
  var formatter = DateFormat.yMMMMEEEEd('id');
  String date = formatter.format(now);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Alamat Pengantaran", style: TextStyle(fontSize: 14, color: CulinaryColors.subtext),),
                Icon(Icons.keyboard_arrow_down_rounded, color: CulinaryColors.orange, size: 18),
              ],
            ),
            Text("Kulina"),
          ],
        ),
        elevation: 0,
        leading: Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: CulinaryColors.lightgrey,
                child: DatePicker(
                  DateTime.now(),
                  height: 76,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: CulinaryColors.orange,
                  selectedTextColor: Colors.white,
                  dateTextStyle: TextStyle(fontSize: 12),
                  dayTextStyle: TextStyle(fontSize: 12),
                  monthTextStyle: TextStyle(fontSize: 12, color: Colors.black12.withOpacity(0)),
                  locale: "id",
                  daysCount: 57,
                  // onDateChange: (date) {
                  //   // // New date selected
                  //   // setState(() {
                  //   //   _selectedValue = date;
                  //   }
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(date, style: TextStyle(fontSize: 16, color: CulinaryColors.title, fontWeight: FontWeight.w700)),
              ),
              SizedBox(height: 8),
              Expanded(
                child: FutureBuilder<List<Product>>(
                  future: ProductService().products(),
                  builder: (context, asy) {
                    if (asy.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    if (!asy.hasData) return Container();
                    if (asy.hasData && asy.data.isEmpty)
                      return EmptyProduct();
                    return GridView.builder(
                      itemCount: asy.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.53), 
                      itemBuilder: (_, i) => ProductItem(asy.data[i])
                    );
                  }
                )
              ),
            ],
          ),
        )
      ),
      floatingActionButton: Container(
        width: 380,
        height: 52,
        child: FabCart()),
    );
  }
}