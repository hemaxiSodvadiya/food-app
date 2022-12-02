class FoodModel {
  int id;
  String name;
  double price;
  String image;
  int quantity;
  String isLike;
  double prices;
  FoodModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.isLike,
    required this.image,
    required this.prices,
  });

  factory FoodModel.fromMap({required Map data}) {
    return FoodModel(
      id: data["id"],
      name: data["name"],
      price: data["price"],
      image: data["image"],
      quantity: data["quantity"],
      prices: data["prices"],
      isLike: data["isLike"],
    );
  }
}
