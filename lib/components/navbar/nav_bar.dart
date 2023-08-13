import 'package:flutter/material.dart';
import 'package:my_app/components/navbar/left_bar.dart';
import 'package:my_app/components/navbar/right_bar.dart';
import 'package:my_app/constants.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: kTealBoldColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeftBar(),
          RightBar()
        ],
      ),
    );
  }
}
