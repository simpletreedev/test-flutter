// import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

const timeout = 1200;
const indicatorSize = 45.0;
const radius = 10.0;
// const opacity = 0.5;

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: timeout)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = indicatorSize
    ..radius = radius
    // ..progressColor = Colors.yellow
    // ..backgroundColor = Colors.green
    // ..indicatorColor = Colors.yellow
    // ..textColor = Colors.yellow
    // ..maskColor = Colors.blue.withOpacity(opacity)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}
