import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:my_app/utils/custom_dialog.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatefulWidget {
  @override
  State<CartEmpty> createState() => _CartEmptyState();
}

class _CartEmptyState extends State<CartEmpty> {
  String title = 'Clear your cart',
      description = 'Are you sure that you want to clear your cart?',
      action = 'Clear';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartModel>(context, listen: false);

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
                  onTap: () => provider.cartItems.isEmpty
                      ? null
                      : customDialog(context, title, action, description, () {
                          provider.clearCart();
                          EasyLoading.showToast(
                            'Cart cleared',
                            toastPosition: EasyLoadingToastPosition.top,
                          );
                        }),
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
