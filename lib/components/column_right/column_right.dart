import 'package:flutter/material.dart';
import 'package:my_app/components/column_right/cart/cart_item/cart_item.dart';
import 'package:my_app/components/column_right/cart/total/total.dart';
import 'package:my_app/components/column_right/header_column_right/header_column_right.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class ColumnRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, value, child) {
        return Container(
          color: kWhiteColor,
          child: Column(
            children: [
              // header right
              HeaderColumnRight(),

              // all items cart
              Expanded(
                  child: value.cartItems.isEmpty
                      ? Center(
                          child: Text(
                          'Your cart is empty. \n Please select some product by clicking on it.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ))
                      : Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ListView.builder(
                            itemCount: value.cartItems.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: const BorderSide(
                                            color: kGrayColor, width: 1))),
                                child: Column(
                                  children: [
                                    CartItem(
                                        cartItem: value.cartItems[index]!,
                                        cartItemIndex: index)
                                  ],
                                ),
                              );
                            },
                          ),
                        )),

              // total cart
              Total(value: value)
            ],
          ),
        );
      },
    );
  }
}
