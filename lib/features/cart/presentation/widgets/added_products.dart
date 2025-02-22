import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entines/product.dart';
import '../manager/cart/cart_cubit.dart';


class AddedProducts extends StatelessWidget {
  final List<Product> products;

  const AddedProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return SizedBox(
        height: 70,
        child: Center(child: Text("No Products Added")),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(products[index].productImage),
                      ),
                      Positioned(
                        right: -5,
                        top: -5,
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .removeProductFromCart(products[index]);
                          },
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.remove,
                                color: Colors.white, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "Price : ${products[index].price}",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
