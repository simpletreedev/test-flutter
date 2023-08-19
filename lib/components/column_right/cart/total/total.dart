import 'package:flutter/material.dart';
import 'package:my_app/components/column_right/cart/total/cart_empty/cart_empty.dart';
import 'package:my_app/components/column_right/cart/total/cart_pay/cart_pay.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class Total extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          // subtotal cart
          Row(
            children: [
              Text(
                'SUBTOTAL',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              Spacer(),
              Text(
                '\$${provider.calculateTotal()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 13),
              )
            ],
          ),
          SizedBox(height: 6),

          Divider(
            color: Color.fromARGB(255, 224, 223, 223),
            height: 4,
            indent: 0,
            thickness: 3,
          ),

          // total cart
          Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 18),
            child: Row(
              children: [
                Text('TOTAL',
                    style: TextStyle(
                        fontSize: 16,
                        color: kTealColor,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                Text(
                  '\$${provider.calculateTotal()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kTealColor),
                )
              ],
            ),
          ),

          CartEmpty(),
          SizedBox(height: 10),
          CartPay(),
        ],
      ),
    );
  }
}
