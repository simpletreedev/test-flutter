import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

void customDialog(BuildContext context, String title, String action,
    String description, Function handleTask) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(kGrayColor)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cancel', style: TextStyle(color: kTealBoldColor))),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(kRedColor)),
            onPressed: () {
              handleTask();
              Navigator.pop(context);
            },
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(action, style: TextStyle(color: kWhiteColor))),
          ),
        ],
      );
    },
  );
}
