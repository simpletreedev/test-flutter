import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class Categories extends StatefulWidget {
  final List<dynamic> categories;
  final String? selectedCat;
  final Function(String?) onCategorySelected;

  Categories(
      {required this.categories,
      required this.selectedCat,
      required this.onCategorySelected});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.categories.length,
        child: Container(
          alignment: Alignment.topLeft,
          height: 36,
          decoration: BoxDecoration(color: kTealColor),
          child: TabBar(
              onTap: (index) {
                widget.onCategorySelected(widget.categories[index]);
              },
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: kWhiteColor,
              dividerColor: Colors.transparent,
              indicator:
                  BoxDecoration(color: Color.fromARGB(255, 234, 234, 234)),
              tabs: widget.categories
                  .map((category) => Tab(
                        child: Text(category, style: TextStyle(fontSize: 13)),
                      ))
                  .toList()),
        ));
  }
}
