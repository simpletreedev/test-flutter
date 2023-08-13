import "package:flutter/material.dart";

class CartModel extends ChangeNotifier {
  List<dynamic> _shopItems = [], _cartItems = [];

  // list of cart items
  List<dynamic> get cartItems => _cartItems;
  List<dynamic> get shopItems => _shopItems;

  void initItems(List<dynamic> products) {
    _shopItems = products;
  }

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // clear all cart items
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // increase item
  void increaseItems(int index) {
    cartItems[index]['quantity']++;
    notifyListeners();
  }

  // decrease item
  void decreaseItems(int index) {
    cartItems[index]['quantity']--;
    notifyListeners();
  }

  String calculateItem(int index) {
    double value = double.parse(cartItems[index]['price']);

    value =
        double.parse(cartItems[index]['price']) * cartItems[index]['quantity'];

    return value.toStringAsFixed(2);
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;

    if (cartItems.isNotEmpty) {
      totalPrice = cartItems
          .map((item) => double.parse(item['price']) * item['quantity'])
          .reduce((value, element) => value + element);
    }

    return totalPrice.toStringAsFixed(2);
  }
}
