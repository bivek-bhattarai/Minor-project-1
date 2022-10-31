import 'package:flutter/material.dart';

class MultipleGlobalWidgets {

  static SnackBar gSnackBar(String text) {
    return SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    );
  }

  static CircleAvatar gCircularAvatar(String image, double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(image),
    );
  }

}