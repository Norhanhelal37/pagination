import 'package:cart/features/cart/domain/entines/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.quantity,
      required super.total,
      required super.discountPercentage,
      required super.discountTotal,
      required super.productImage});

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"],
        discountTotal: json["discountedTotal"],
        productImage: json["thumbnail"]);
  }
}
