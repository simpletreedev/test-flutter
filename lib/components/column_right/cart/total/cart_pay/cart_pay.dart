import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class CartPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          _buildCartPayItem(label: 'ADD NODE', icon: Icons.message),
          SizedBox(width: 10),
          _buildCartPayItem(label: 'ADD FEE OR DISCOUNT', icon: Icons.add),
          SizedBox(width: 10),
          _buildCartPayItem(
              label: 'APPLY COUPON', icon: Icons.card_giftcard_rounded),
          SizedBox(width: 10),
          _buildCartPayItem(label: 'SHIPPING', icon: Icons.local_shipping),
          SizedBox(width: 10),
          _buildCartPayItem(
              label: 'SUSPEND & SAVE CART', icon: Icons.shopping_cart_rounded),
          SizedBox(width: 10),
          Flexible(
              flex: 2,
              child: Container(
                color: Color.fromARGB(255, 160, 167, 0),
                alignment: Alignment.center,
                child: Text(
                  'PAY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
  
  Widget _buildCartPayItem({required String label, required IconData icon}) {
    return Flexible(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(12),
          color: label == 'ADD NODE'
              ? Color.fromARGB(255, 77, 77, 77)
              : label == 'SUSPEND & SAVE CART'
                  ? kOrangeColor
                  : kTealColor,
          alignment: Alignment.center,
          child: Column(
            children: [
              Icon(
                icon,
                color: kWhiteColor,
                size: 18,
              ),
              SizedBox(height: 6),
              SizedBox(
                width: 100,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
