import 'package:cart/features/cart/domain/entines/product.dart';

abstract class Cart {

  final int id;
  final List<Product> products;
  final num total;
  final num discountTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  Cart({required this.id, required this.products, required this.total, required this.discountTotal, required this.userId, required this.totalProducts, required this.totalQuantity});




}