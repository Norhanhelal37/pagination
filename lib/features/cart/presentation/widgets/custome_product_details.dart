
import 'package:cart/features/cart/domain/entines/product.dart';
import 'package:cart/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeProductDetails extends StatelessWidget {
  final Product product;
  
  const CustomeProductDetails(
      {super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(product.productImage),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product.title,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: 10),
          width: 70,
          height: 40,
          decoration: BoxDecoration(
              color:context.read<CartCubit>().myProducts.contains(product)?Colors.grey: const Color.fromARGB(255, 157, 8, 170),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: TextButton(
              onPressed: () {
                if(context.read<CartCubit>().myProducts.contains(product)){
                  context.read<CartCubit>().removeProductFromCart(product);

                }else{

                context.read<CartCubit>().addProduct(product);
                }
              },
              child: Center(
                child: Text(context.read<CartCubit>().myProducts.contains(product)?"remove":"Add",style: TextStyle(color: Colors.white),),
              )),
        )
      ],
    );
  }
}
