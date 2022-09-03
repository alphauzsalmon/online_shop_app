import 'package:online_shop_app/infrastructure/data_source/cart_data_provider.dart';
import 'package:online_shop_app/infrastructure/models/cart_model.dart';

abstract class BaseCartRepository {
  Future<CartModel> getCart();
}

class CartRepository extends BaseCartRepository {
  final CartDataProvider _dataProvider;
  CartRepository(this._dataProvider);

  @override
  Future<CartModel> getCart() async {
    final response = await _dataProvider.getCart();
    if (response.runtimeType == CartModel) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}