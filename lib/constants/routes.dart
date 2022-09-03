import 'package:flutter/cupertino.dart';
import 'package:online_shop_app/screens/home_page.dart';

class NavigationService {
  static Route<dynamic>? onGenerate(final RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return HomePage.route(settings);
      default:
        return null;
    }
  }
}
