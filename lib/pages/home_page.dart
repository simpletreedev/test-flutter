import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/components/column_left/column_left.dart';
import 'package:my_app/components/column_right/column_right.dart';
import 'package:my_app/components/navbar/nav_bar.dart';
import 'package:my_app/constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  void initState() {
    super.initState();
    EasyLoading.show(status: 'Loading...');

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    if (!_isLoading) {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appHeightInPercent = screenHeight * 0.01;

    return _isLoading
        ? Center()
        : Scaffold(
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
