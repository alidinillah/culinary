import 'package:culinary/culinary_colors.dart';
import 'package:culinary/models/products.dart';
import 'package:culinary/notifiers/cart_notifier.dart';
import 'package:culinary/services/product_service.dart';
import 'package:culinary/views/product_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MultiProvider(
      providers: [
        FutureProvider<List<Product>>.value(
          value: ProductService().products().catchError((e) => print(e)),
        ),
        ChangeNotifierProvider<CartNotifier>(
        create: (_) => CartNotifier())
      ],
      child:
       MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductList(),
      ),
    );
  }
}

MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  
  <int, Color>{
    50: Color(CulinaryColors.main),
    100: Color(CulinaryColors.main),
    200: Color(CulinaryColors.main),
    300: Color(CulinaryColors.main),
    400: Color(CulinaryColors.main),
    500: Color(CulinaryColors.main),
    600: Color(CulinaryColors.main),
    700: Color(CulinaryColors.main),
    800: Color(CulinaryColors.main),
    900: Color(CulinaryColors.main),
  },
);