import 'package:cart/core/errors/exceptions.dart';
import 'package:cart/core/errors/failures.dart';
import 'package:cart/core/network/check_connection.dart';
import 'package:cart/features/cart/data/dataSources/remote_data_source.dart';
import 'package:cart/features/cart/data/models/cart_model.dart';
import 'package:cart/features/cart/data/models/product_model.dart';

import 'package:cart/features/cart/domain/reposatory/carts_reposatory.dart';
import 'package:dartz/dartz.dart';

class DataReposatory extends CartsReposatory {
  final RemoteDataSource remoteDataSource;
  final DeviceConnection isDeviceConnected;

  DataReposatory(this.isDeviceConnected, {required this.remoteDataSource});
  @override
  Future<Either<Failures, List<CartModel>>> getAllCarts(int limit , int skip) async {
    if (await isDeviceConnected.deviceConnected) {
      try {
        final carts = await remoteDataSource.getAllCarts(limit, skip);
        return Right(carts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failures, Unit>> addProduct(ProductModel prduct) async{
    
    if (await isDeviceConnected.deviceConnected) {
      try {
        
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
