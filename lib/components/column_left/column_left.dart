import 'package:flutter/material.dart';
import 'package:my_app/components/column_left/categories/categories.dart';
import 'package:my_app/components/column_left/header_column_left/header_column_left.dart';
import 'package:my_app/components/column_left/list_products/list_products.dart';
import 'package:my_app/fetch_api.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class ColumnLeft extends StatefulWidget {
  @override
  ColumnLeftState createState() => ColumnLeftState();
}

class ColumnLeftState extends State<ColumnLeft> {
  List<dynamic> categories = [], products = [], productsOfCat = [];
  String cat = 'Beef';
  String? selectedCat;
  // final _scrollController = ScrollController();
  // int numLoad = 0;

  // load first
  Future<void> initProducts() async {
    List<dynamic> cats = await fetchCategories();
    setState(() {
      categories = cats;
    });
    productsOfCat = await fetchProducts(cat: cat);
    setState(() {
      products.addAll(productsOfCat);
    });
  }

  // selected category
  void updateSelectedCategory(String? category) {
    setState(() {
      selectedCat = category;
    });
  }

  // filter products by category selected
  Future<List<dynamic>> filterProductsByCategory() async {
    if (selectedCat == null) {
      return products;
    } else {
      products = await fetchProducts(cat: selectedCat.toString());
      return products;
    }
  }

  // load more when scroll down
  // Future<void> _loadMoreData() async {
  //   if (numLoad < categories.length) {
  //     productsOfCat = await fetchProducts(cat: categories[numLoad]);

  //     setState(() {
  //       products.addAll(productsOfCat);
  //     });
  //   }
  // }

  //
  // void _scrollListener() {
  //   if (_scrollController.offset ==
  //       _scrollController.position.maxScrollExtent) {
  //     setState(() {
  //       numLoad++;
  //     });

  //     _loadMoreData();
  //   }
  // }

  //
  @override
  void initState() {
    super.initState();
    initProducts();
    // _scrollController.addListener(_scrollListener);
  }

  //
  // @override
  // void dispose() {
  //   _scrollController.removeListener(_scrollListener);
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Provider.of<CartModel>(context, listen: false).initItems(products);
    return Column(
      children: [
        HeaderColumnLeft(),
        Categories(
            categories: categories,
            selectedCat: selectedCat,
            onCategorySelected: updateSelectedCategory),
        Expanded(
            child: SingleChildScrollView(
                // controller: _scrollController,
                child: ListProducts(productsData: filterProductsByCategory())))
      ],
    );
  }
}
