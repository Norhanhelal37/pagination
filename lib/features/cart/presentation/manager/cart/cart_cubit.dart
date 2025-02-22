import 'package:cart/features/cart/domain/usecases/get_all_carts_usecase.dart';
import 'package:cart/features/cart/presentation/manager/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart_model.dart';

import '../../../domain/entines/product.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.getAllCartsUsecase) : super(CartInitialState());

  final GetAllCartsUsecase getAllCartsUsecase;
  int limit = 20;
  int skip = 0;
  bool hasMore = true;
  bool isLoading = false;
  List<CartModel> carts = [];
  List<Product> myProducts = [];
  List<CartModel> filteredCarts = [];
  TextEditingController searchController = TextEditingController();

  void getAllCarts({bool isLoadMore = false}) async {
    if (isLoading) return;
    if (!hasMore && isLoadMore) return;

    isLoading = true;

    if (!isLoadMore) {
      skip = 0;
      hasMore = true;
      carts.clear();
      emit(CartLoadingState());
    } else {
      emit(CartLoadMoreState());
    }

    final result = await getAllCartsUsecase.execute(limit, skip);
    result.fold(
      (error) {
        isLoading = false;
        emit(CartFailureState(errorMessage: "An Error Occurred"));
      },
      (data) {
        if (data.isEmpty) {
          hasMore = false;
        } else {
          final newItems = data
              .where(
                (cart) => !carts.any((loadedCart) => loadedCart.id == cart.id),
              )
              .toList();

          carts.addAll(newItems);
          skip += limit;
        }

        isLoading = false;
        emit(CartLoadedState(cartList: carts));
      },
    );
  }

  void addProduct(Product product) {
    myProducts.add(product);
    emit(AddToCartState(products: myProducts));
  }

  void removeProductFromCart(Product product) {
    myProducts.remove(product);
    emit(RemoveFromeCartState(products: myProducts));
  }

  void searchProduct(String query) {
    filteredCarts = carts.where((cart) {
      return cart.products.any((product) =>
          product.title.toLowerCase().contains(query.toLowerCase()));
    }).toList();
    
    emit(SearchFromCartState(cartList: filteredCarts));
  }
}
