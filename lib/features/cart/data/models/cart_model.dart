import 'package:cart/features/cart/data/models/product_model.dart';
import 'package:cart/features/cart/domain/entines/cart.dart';


class CartModel extends Cart {
  CartModel(
      {required super.id,
      required super.products,
      required super.total,
      required super.discountTotal,
      required super.userId,
      required super.totalProducts,
      required super.totalQuantity});

  factory CartModel.fromJson(dynamic json) {
    return CartModel(
        id: json["id"],
        products: (json["products"] as List<dynamic>) 
        .map((prod) => ProductModel.fromJson(prod)) 
        .toList(),
        total: json["total"],
        discountTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"]);
  }
}
