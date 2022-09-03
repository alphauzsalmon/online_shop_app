class CartModel {
  CartModel({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  List<Basket> basket;
  String delivery;
  String id;
  int total;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    basket: List<Basket>.from(json["basket"].map((x) => Basket.fromJson(x))),
    delivery: json["delivery"],
    id: json["id"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "basket": List<dynamic>.from(basket.map((x) => x.toJson())),
    "delivery": delivery,
    "id": id,
    "total": total,
  };
}

class Basket {
  Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  int id;
  String images;
  int price;
  String title;

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
    id: json["id"],
    images: json["images"],
    price: json["price"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": images,
    "price": price,
    "title": title,
  };
}
