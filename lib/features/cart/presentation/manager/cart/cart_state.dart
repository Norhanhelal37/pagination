import 'package:cart/features/cart/data/models/cart_model.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entines/product.dart';

abstract class CartState extends Equatable {}

class CartInitialState extends CartState {
  final List<CartModel> cartList = [];
  @override
  List<Object?> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CartLoadedState extends CartState {
  final List<CartModel> cartList;

  CartLoadedState({required this.cartList});
  @override
  List<Object?> get props => [];
}

class CartLoadMoreState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartFailureState extends CartState {
  final String errorMessage;

  CartFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [];
}

class AddToCartState extends CartState {
  final List<Product> products;

  AddToCartState({required this.products});

  @override
  List<Object?> get props => [];
}

class RemoveFromeCartState extends CartState {
  final List<Product> products;

  RemoveFromeCartState({required this.products});

  @override
  List<Object?> get props => [];
}

class SearchFromCartState extends CartState {
  final List<CartModel> cartList;

  SearchFromCartState({required this.cartList});

  @override
  List<Object?> get props => [];
}
