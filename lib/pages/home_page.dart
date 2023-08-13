import 'package:flutter/material.dart';
import 'package:my_app/components/column_left/column_left.dart';
import 'package:my_app/components/column_right/column_right.dart';
import 'package:my_app/components/navbar/nav_bar.dart';
import 'package:my_app/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appHeightInPercent = screenHeight * 0.01;

    return Scaffold(
        backgroundColor: kGrayColor,
        body: SizedBox(
          height: appHeightInPercent * 100,
          child: Column(
            children: [
              NavBar(),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ColumnLeft(),
                  ),
                  Expanded(child: ColumnRight()),
                ],
              ))
            ],
          ),
        ));
  }
}
