import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final dynamic cartItem, cartItemIndex;

  CartItem({required this.cartItem, required this.cartItemIndex});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // remove item
        InkWell(
          hoverColor: Color.fromARGB(255, 198, 83, 56),
          borderRadius: BorderRadius.circular(10),
          onTap: () => Provider.of<CartModel>(context, listen: false)
              .removeItemFromCart(cartItemIndex),
          child: Icon(
            Icons.close,
            size: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 20),

        // image item
        Image.network(
          cartItem['strMealThumb'],
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 30),

        // name item
        SizedBox(
          width: 300,
          child: Text(
            cartItem['strMeal'],
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const Spacer(),

        // adjust quantity
        Row(
          children: [
            InkWell(
              onTap: () => cartItem['quantity'] > 1
                  ? Provider.of<CartModel>(context, listen: false)
                      .decreaseItems(cartItemIndex)
                  : null,
              child: Container(
                padding: EdgeInsets.all(6),
                color: kTealColor,
                child: Icon(
                  Icons.remove,
                  color: kWhiteColor,
                  size: 16,
                ),
              ),
            ),
            Container(
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 0.1),
                      top: BorderSide(color: Colors.black, width: 0.1))),
              padding: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
              child: Text(
                cartItem['quantity'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            InkWell(
              onTap: () => Provider.of<CartModel>(context, listen: false)
                  .increaseItems(cartItemIndex),
              child: Container(
                padding: EdgeInsets.all(6),
                color: kTealColor,
                child: Icon(
                  Icons.add,
                  color: kWhiteColor,
                  size: 16,
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 30),

        // price original
        Container(
            alignment: Alignment.centerRight,
            width: 40,
            child: Text('\$${cartItem['price']}',
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold))),
        const SizedBox(width: 40),

        // price with quantity
        Container(
            alignment: Alignment.centerRight,
            width: 50,
            child: Text(
                '\$${Provider.of<CartModel>(context, listen: false).calculateItem(cartItemIndex)}',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
