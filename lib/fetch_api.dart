// fetch all categories
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/constants.dart';

Future<List<dynamic>> fetchCategories() async {
  final response = await http.get(Uri.parse(categoriesUrl));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    List<dynamic> results = jsonData['meals'];

    List<dynamic> data =
        results.map((cat) => cat['strCategory']).toList().sublist(0, 6);

    // list want to remove
    List<dynamic> catRemove = ['Goat', 'Breakfast'];
    data.removeWhere((element) => catRemove.contains(element));
    data.insert(0, 'All');
    return data;
  } else {
    throw Exception('Failed to load category');
  }
}

// fetch products by category
Future<List<dynamic>> fetchProducts({required String cat}) async {
  final response = await http.get(Uri.parse(productsUrl + cat));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    List<dynamic> results = jsonData['meals'];

    List<dynamic> data = results
        .map((product) {
          // fake price
          final price = double.parse(product['idMeal']) / 1000;

          return {
            ...product,
            'price': double.parse(price.toStringAsFixed(2)),
            'quantity': 1
          };
        })
        .toList()
        .sublist(0, 6);

    return data;
  } else {
    throw Exception('Failed to load products');
  }
}
