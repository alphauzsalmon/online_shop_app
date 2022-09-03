import 'package:online_shop_app/infrastructure/data_source/main_page_data_provider.dart';
import 'package:online_shop_app/infrastructure/models/main_page_model.dart';

abstract class BaseMainPageRepository {
  Future<MainPageModel> getProducts();
}

class MainPageRepository extends BaseMainPageRepository {
  final MainPageDataProvider _dataProvider;
  MainPageRepository(this._dataProvider);

  @override
  Future<MainPageModel> getProducts() async {
    final response = await _dataProvider.getProducts();
    if (response.runtimeType == MainPageModel) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}