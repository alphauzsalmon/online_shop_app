import 'package:dio/dio.dart';
import 'package:online_shop_app/constants/urls.dart';
import 'package:online_shop_app/infrastructure/models/product_model.dart';

class ProductDataProvider {
  ProductDataProvider();

  Future getProduct() async {
    final Dio dio = Dio();
    final Response response = await dio.get(productApiUrl);
    switch (response.statusCode) {
      case 200:
        return ProductModel.fromJson(response.data);
      default:
        return response.statusCode;
    }
  }
}