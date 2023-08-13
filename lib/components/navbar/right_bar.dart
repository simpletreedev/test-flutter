import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class RightBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.notifications, color: kWhiteColor, size: 20),
            SizedBox(width: 16),
            Icon(Icons.expand_more, color: kWhiteColor, size: 20),
            SizedBox(width: 16),
            Image.asset(
              'images/avatarDefault.jpg',
              width: 26,
              height: 26,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text('Test Test',
                style: TextStyle(color: kWhiteColor, fontSize: 13)),
          ],
        ),
        SizedBox(width: 56),
        Container(
          color: kRedColor,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout_sharp, color: kWhiteColor, size: 16),
              Text(
                'LOGOUT',
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 9,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
