import 'package:online_shop_app/infrastructure/data_source/product_data_provider.dart';
import 'package:online_shop_app/infrastructure/models/product_model.dart';

abstract class BaseProductRepository {
  Future<ProductModel> getProduct();
}

class ProductRepository extends BaseProductRepository {
  final ProductDataProvider _dataProvider;
  ProductRepository(this._dataProvider);

  @override
  Future<ProductModel> getProduct() async {
    final response = await _dataProvider.getProduct();
    if (response.runtimeType == ProductModel) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}