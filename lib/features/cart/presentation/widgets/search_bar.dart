import 'package:cart/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      width: 370,
      height: 70,

      child: TextField(
        controller: context.read<CartCubit>().searchController,
        onChanged: (value) {
          context.read<CartCubit>().searchProduct(value);
        },
        decoration: InputDecoration(
          hintText: "search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
