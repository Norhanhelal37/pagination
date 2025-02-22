import 'package:cart/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:cart/features/cart/presentation/manager/cart/cart_state.dart';
import 'package:cart/features/cart/presentation/widgets/carts_list.dart';
import 'package:cart/features/cart/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependancy.dart';
import '../../domain/entines/product.dart';
import '../widgets/added_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => depen<CartCubit>()..getAllCarts(),
        child: Scaffold(
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              List<Product> products = context.watch<CartCubit>().myProducts;
              if (state is CartLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CartFailureState) {
                return Center(child: Text(state.errorMessage));
              } else {
                return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      final cartCubit = context.read<CartCubit>();
                      if (notification.metrics.pixels >=
                              notification.metrics.maxScrollExtent * 0.9 &&
                          cartCubit.hasMore &&
                          !cartCubit.isLoading) {
                        cartCubit.getAllCarts(isLoadMore: true);
                      }
                      return true;
                    },
                    child: Column(
                      children: [
                        AddedProducts(products: products,),
                        CustomeSearchBar(),
                        CartsList(myCarts:context.read<CartCubit>().filteredCarts.isNotEmpty?  context.read<CartCubit>().filteredCarts  :  context.read<CartCubit>().carts )
                      ],
                    ));
              }
            },
          ),
        ),
      ),
    );
  }
}
