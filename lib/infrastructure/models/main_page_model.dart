class MainPageModel {
  MainPageModel({
    required this.homeStore,
    required this.bestSeller,
  });

  List<HomeStore> homeStore;
  List<BestSeller> bestSeller;

  factory MainPageModel.fromJson(Map<String, dynamic> json) => MainPageModel(
    homeStore: List<HomeStore>.from(json["home_store"].map((x) => HomeStore.fromJson(x))),
    bestSeller: List<BestSeller>.from(json["best_seller"].map((x) => BestSeller.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "home_store": List<dynamic>.from(homeStore.map((x) => x.toJson())),
    "best_seller": List<dynamic>.from(bestSeller.map((x) => x.toJson())),
  };
}

class BestSeller {
  BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  int id;
  bool isFavorites;
  String title;
  int priceWithoutDiscount;
  int discountPrice;
  String picture;

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
    id: json["id"],
    isFavorites: json["is_favorites"],
    title: json["title"],
    priceWithoutDiscount: json["price_without_discount"],
    discountPrice: json["discount_price"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_favorites": isFavorites,
    "title": title,
    "price_without_discount": priceWithoutDiscount,
    "discount_price": discountPrice,
    "picture": picture,
  };
}

class HomeStore {
  HomeStore({
    required this.id,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  int id;
  bool isNew;
  String title;
  String subtitle;
  String picture;
  bool isBuy;

  factory HomeStore.fromJson(Map<String, dynamic> json) => HomeStore(
    id: json["id"],
    isNew: json["is_new"] ?? false,
    title: json["title"],
    subtitle: json["subtitle"],
    picture: json["picture"],
    isBuy: json["is_buy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_new": isNew,
    "title": title,
    "subtitle": subtitle,
    "picture": picture,
    "is_buy": isBuy,
  };
}
