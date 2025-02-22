import 'package:cart/core/errors/failures.dart';
import 'package:cart/features/cart/data/models/cart_model.dart';
import 'package:cart/features/cart/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartsReposatory {
  Future<Either<Failures, List<CartModel>>> getAllCarts(int limit, int skip);
  Future<Either<Failures, Unit>> addProduct(ProductModel prduct);
}
