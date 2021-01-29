import 'package:culinary/config/dio_config.dart';
import 'package:culinary/models/products.dart';
import 'package:dio/dio.dart';

class ProductService {
  Future<List<Product>> products() async {
    Response response = await DioConfig.get().get("/products");
    List maps = response.data;
    List<Product> products = maps.map((p) => Product.fromMap(p)).toList();
    return products;
  }
}