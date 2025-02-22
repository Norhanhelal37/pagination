import 'package:cart/features/cart/data/models/cart_model.dart';
import 'package:cart/features/cart/presentation/widgets/custome_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cart/cart_cubit.dart';

class CartsList extends StatelessWidget {
  final List<CartModel> myCarts;
  const CartsList({super.key, required this.myCarts});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: ListView.builder(
        itemCount: myCarts.length ,
        itemBuilder: (context, index) {
          if (index < context.read<CartCubit>().carts.length) {
            return Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 141, 234),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: ExpansionTile(
                    minTileHeight: 70,
      
                      
                      collapsedShape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shape:
                          Border.all(color: const Color.fromARGB(255, 248, 141, 234)),
                      title: Text("Cart ${myCarts[index].id}"),
                      
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: myCarts[index].products.length,
                          shrinkWrap: true,
                          itemBuilder: (context, ind) {
                            
                                return CustomeProductDetails(
                                  product: myCarts[index].products[ind] ,
                                );
                              },
                            )
                          
                        
                      ]),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
