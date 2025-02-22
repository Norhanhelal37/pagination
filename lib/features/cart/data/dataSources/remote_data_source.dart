import 'package:cart/core/errors/exceptions.dart';
import 'package:cart/core/network/api_constants.dart';
import 'package:cart/features/cart/data/models/cart_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<List<CartModel>> getAllCarts(int limit, int skip);
}

class RemoteDatatSourceImple extends RemoteDataSource {
  final Dio dio;

  RemoteDatatSourceImple({required this.dio});
  @override
  Future<List<CartModel>> getAllCarts(int limit, int skip) async {
    final response = await dio.get(ApiConstants.baseUrl, queryParameters: {
      "limit": limit,
       "skip":skip
    });
    if (response.statusCode == 200) {
      final data = response.data;
      List<CartModel> carts = (data["carts"] as List<dynamic>)
          .map((cart) => CartModel.fromJson(cart))
          .toList();
      print(carts);
      return carts;
    } else {
      throw ServerException();
    }
  }
}
