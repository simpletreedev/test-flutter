import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class HeaderColumnRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kGrayColor,
        child: DefaultTabController(
          length: 4,
          child: Container(
            height: 40,
            alignment: Alignment.topLeft,
            child: TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: kWhiteColor,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(color: kWhiteColor),
                tabs: [
                  Tab(
                    child: _buildItemHeader('Cart', Icons.shopping_cart),
                  ),
                  Tab(
                    child: _buildItemHeader('Customer Guest', Icons.face),
                  ),
                  Tab(
                    child: _buildItemHeader('Address', Icons.location_on_sharp),
                  ),
                  Icon(Icons.shopping_cart,
                      color: Color.fromARGB(255, 234, 213, 173)),
                ]),
          ),
        ));
  }

  Row _buildItemHeader(String label, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.black,
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
