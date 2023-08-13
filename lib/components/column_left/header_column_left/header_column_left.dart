import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class HeaderColumnLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kWhiteColor,
        padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
        child: Row(children: [
          Image.asset(
            'images/logo.png',
            height: 30,
          ),
          SizedBox(width: 20),
          SizedBox(
            width: 480,
            height: 30,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 14),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 18,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: kTealColor))),
            ),
          ),
          Spacer(),
          Container(
            color: kTealBoldColor,
            padding: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.all_inbox_sharp, color: kWhiteColor, size: 18),
              ],
            ),
          )
        ]));
  }
}
