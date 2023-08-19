import "package:flutter/material.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class ListProducts extends StatelessWidget {
  final Future<List<dynamic>> productsData;

  ListProducts({required this.productsData});
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center();
        } else if (snapshot.hasError) {
          return Container(
              alignment: Alignment.center,
              // height: 700,
              child: Text('Error: ${snapshot.error}'));
        } else {
          List<dynamic>? products = snapshot.data;

          return Container(
            color: kGrayColor,
            child: GridView.builder(
              padding: EdgeInsets.all(18),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 3 / 2),
              shrinkWrap: true,
              itemCount: products?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Provider.of<CartModel>(context, listen: false)
                        .addItemToCart(products?[index]);
                    EasyLoading.showToast(
                      'Add to cart successfully',
                      toastPosition: EasyLoadingToastPosition.top,
                    );
                  },
                  child: Container(
                      color: kWhiteColor,
                      alignment: Alignment.center,
                      height: 100,
                      child: GridTile(
                          footer: Material(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(4))),
                            clipBehavior: Clip.antiAlias,
                            child: GridTileBar(
                              backgroundColor: Colors.black45,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      products?[index]['strMeal'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: kWhiteColor, fontSize: 13),
                                    ),
                                  ),
                                  Text(
                                      '\$${products?[index]['price'].toString()}',
                                      style: TextStyle(
                                          color: kWhiteColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                          child: Image.network(products?[index]['strMealThumb'],
                              fit: BoxFit.cover))),
                );
              },
            ),
          );
        }
      },
    );
  }
}
