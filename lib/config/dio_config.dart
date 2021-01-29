import 'package:dio/dio.dart';

class DioConfig {
  static Dio dio;
  static const String KEY_AUTH = "Authorization";
  static Dio get(){
    if (dio == null){
      dio = new Dio();
      dio.options.connectTimeout = 5000; //5s
      dio.options.receiveTimeout = 3000;
      dio.options.contentType = "application/json";
      dio.options.baseUrl = "https://kulina-recruitment.herokuapp.com/";
    }
    return dio;
  }
}