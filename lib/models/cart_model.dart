import 'dart:convert';

import "package:flutter/material.dart";
import 'package:my_app/utils/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartModel extends ChangeNotifier {
  List<dynamic> _shopItems = [], _cartItems = [];

  // list of cart items
  List<dynamic> get cartItems => _cartItems;
  List<dynamic> get shopItems => _shopItems;

  // init products
  // void initItems(List<dynamic> products) {
  //   _shopItems = products;
  // }

  // init cart
  void initCartItems() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? dataStringList = prefs.getStringList('cart');

    if (dataStringList != null && dataStringList.isNotEmpty) {
      _cartItems = dataStringList.map((item) => jsonDecode(item)).toList();
    }
    notifyListeners();
  }

  // add item to cart
  void addItemToCart(dynamic product) async {
    bool isAdded = false;
    for (dynamic item in _cartItems) {
      if (item['idMeal'] == product['idMeal'].toString()) {
        item['quantity']++;
        isAdded = true;
        break;
      }
    }

    if (!isAdded) {
      _cartItems.add(product);
    }

    setLocalStorageCart(key: 'cart', value: _cartItems);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(String id) {
    dynamic itemTmp;

    // remove item and save item to tmp
    _cartItems.removeWhere((item) {
      if (item['idMeal'] == id) {
        itemTmp = item;
        return true;
      }
      return false;
    });

    // update quantity of item has been deleted
    if (itemTmp != null) {
      itemTmp['quantity'] = 1;
    }

    setLocalStorageCart(key: 'cart', value: _cartItems);
    notifyListeners();
  }

  // clear all cart items
  void clearCart() {
    for (dynamic item in _cartItems) {
      item['quantity'] = 1;
    }
    _cartItems.clear();
    removeLocalStorage(key: 'cart');
    notifyListeners();
  }

  // increase or decrease quantity
  void handleQuantity({required String key, required String id}) {
    final item = _cartItems.firstWhere((element) => element['idMeal'] == id,
        orElse: () => null);

    if (item != null && key == 'increase') {
      item['quantity']++;
    } else if (item != null && key == 'decrease') {
      item['quantity']--;
    } else {
      throw Exception("Invalid key of quantity");
    }

    setLocalStorageCart(key: 'cart', value: _cartItems);
    notifyListeners();
  }

  // calculate price of single item
  String calculateItem(String id) {
    final item = _cartItems.firstWhere((element) => element['idMeal'] == id,
        orElse: () => null);

    final priceOfItem = item['price'] * item['quantity'];

    return priceOfItem.toStringAsFixed(2);
  }

  // calculate total all of items
  String calculateTotal() {
    double totalPrice = 0;

    if (_cartItems.isNotEmpty) {
      totalPrice = _cartItems
          .map((item) => item['price'] * item['quantity'])
          .reduce((value, element) => value + element);
    }

    return totalPrice.toStringAsFixed(2);
  }
}
