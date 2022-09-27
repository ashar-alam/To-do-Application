import 'package:flutter/material.dart';

class Utils {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
