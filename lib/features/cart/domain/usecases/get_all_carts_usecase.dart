import 'package:cart/core/errors/failures.dart';
import 'package:cart/features/cart/data/models/cart_model.dart';
import 'package:cart/features/cart/domain/reposatory/carts_reposatory.dart';
import 'package:dartz/dartz.dart';

class GetAllCartsUsecase {
  final CartsReposatory cartsReposatory;

  GetAllCartsUsecase({required this.cartsReposatory});

  Future<Either<Failures, List<CartModel>>> execute(int limit, int skip) {
    return cartsReposatory.getAllCarts(limit ,skip);
  }
}
