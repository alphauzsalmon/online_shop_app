import 'package:dio/dio.dart';
import 'package:online_shop_app/constants/urls.dart';
import 'package:online_shop_app/infrastructure/models/cart_model.dart';

class CartDataProvider {
  CartDataProvider();

  Future getCart() async {
    final Dio dio = Dio();
    final Response response = await dio.get(cartApiUrl);
    switch (response.statusCode) {
      case 200:
        return CartModel.fromJson(response.data);
      default:
        return response.statusCode;
    }
  }
}