import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/components/column_left/categories/categories.dart';
import 'package:my_app/components/column_left/header_column_left/header_column_left.dart';
import 'package:my_app/components/column_left/list_products/list_products.dart';
import 'package:my_app/fetch_api.dart';

class ColumnLeft extends StatefulWidget {
  @override
  State<ColumnLeft> createState() => _ColumnLeftState();
}

class _ColumnLeftState extends State<ColumnLeft> {
  List<dynamic> _categories = [], _products = [], _allProducts = [];
  String? _selectedCat;

  // load first
  Future<void> initProducts() async {
    EasyLoading.show(status: 'Loading...');

    // fetch categories
    List<dynamic> cats = await fetchCategories();
    setState(() {
      _categories = cats;
    });

    // all products
    List<dynamic> productsTmp = [], productsOfCat = [];
    for (dynamic cat in _categories) {
      if (cat != 'All') {
        productsOfCat = await fetchProducts(cat: cat);
        setState(() {
          productsTmp.addAll(productsOfCat);
        });
      }
    }

    setState(() {
      _allProducts.addAll(productsTmp);
    });

    EasyLoading.dismiss();
  }

  // selected category
  void updateSelectedCategory(String? category) {
    setState(() {
      _selectedCat = category;
    });
  }

  // filter products by category selected
  Future<List<dynamic>> filterProductsByCategory() async {
    if (_selectedCat == null || _selectedCat == 'All') {
      return _allProducts;
    } else {
      EasyLoading.show(status: 'Loading...');
      _products = await fetchProducts(cat: _selectedCat.toString());
      EasyLoading.dismiss();
      return _products;
    }
  }

  //
  @override
  void initState() {
    super.initState();
    initProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderColumnLeft(),
        Categories(
            categories: _categories,
            selectedCat: _selectedCat,
            onCategorySelected: updateSelectedCategory),
        Expanded(
            child: SingleChildScrollView(
                child: ListProducts(productsData: filterProductsByCategory())))
      ],
    );
  }
}
