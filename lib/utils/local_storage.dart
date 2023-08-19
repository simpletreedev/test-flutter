import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// // Future<List<String>> getLocalStorage({required String key}) async {
// //   final prefs = await SharedPreferences.getInstance();
// //   List<String> dataStringList = prefs.getStringList(key)!;

// //   return dataStringList;
// // }


// for cart
void setLocalStorageCart(
    {required String key, required List<dynamic> value}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(
      key, (value.map((item) => jsonEncode(item))).toList());
}

void removeLocalStorage({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
