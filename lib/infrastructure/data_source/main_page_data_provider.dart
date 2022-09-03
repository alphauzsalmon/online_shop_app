import 'package:dio/dio.dart';
import 'package:online_shop_app/constants/urls.dart';
import '../models/main_page_model.dart';

class MainPageDataProvider {
  MainPageDataProvider();

  Future getProducts() async {
    final Dio dio = Dio();
    final Response response = await dio.get(mainPageApiUrl);
    switch (response.statusCode) {
      case 200:
        return MainPageModel.fromJson(response.data);
      default:
        return response.statusCode;
    }
  }
}