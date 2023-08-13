import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          // fake distance empty
          Flexible(flex: 1, child: Container()),
          SizedBox(width: 10),
          Flexible(flex: 1, child: Container()),
          SizedBox(width: 10),
          Flexible(flex: 1, child: Container()),
          SizedBox(width: 10),
          Flexible(flex: 1, child: Container()),
          SizedBox(width: 10),
          Flexible(flex: 1, child: Container()),
          SizedBox(width: 10),
          
          // clear all cart
          Flexible(
              flex: 2,
              child: InkWell(
                  onTap: () => Provider.of<CartModel>(context, listen: false)
                      .clearCart(),
                  child: Container(
                      color: Color.fromARGB(255, 198, 83, 56),
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.close,
                            size: 18,
                            color: kWhiteColor,
                          ),
                          SizedBox(width: 4),
                          Text('EMPTY CART',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.bold))
                        ],
                      ))))
        ],
      ),
    );
  }
}
