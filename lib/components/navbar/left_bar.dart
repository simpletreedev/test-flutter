import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class LeftBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon menu
        Container(
          color: kTealColor,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu, color: kWhiteColor, size: 20),
            ],
          ),
        ),

        // icon store
        Container(
          // color: Colors.red,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.store, color: kWhiteColor, size: 20),
            ],
          ),
        ),
        SizedBox(width: 16),

        // info store
        Row(
          children: [
            Text('Store:',
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
            SizedBox(width: 4),
            Text(
              'Food Store',
              style: TextStyle(color: kWhiteColor, fontSize: 13),
            )
          ],
        ),
        SizedBox(width: 16),
        Row(
          children: [
            Text('Register:',
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
            SizedBox(width: 4),
            Text(
              'Register 1',
              style: TextStyle(color: kWhiteColor, fontSize: 13),
            )
          ],
        )
      ],
    );
  }
}
