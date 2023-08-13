// fetch all categories
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/constants.dart';
import 'package:my_app/random_price.dart';

Future<List<dynamic>> fetchCategories() async {
  final response = await http.get(Uri.parse(categoriesUrl));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    List<dynamic> results = jsonData['meals'];

    List<dynamic> data = results.map((cat) => cat['strCategory']).toList();
    // data.insert(0, 'All');

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

    List<dynamic> data = results.map((product) {
      double? price = generateDouble();

      return {...product, 'price': price.toString(), 'quantity': 1};
    }).toList();

    return data;
  } else {
    throw Exception('Failed to load products');
  }
}
