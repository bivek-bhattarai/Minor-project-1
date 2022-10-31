import 'package:flutter/material.dart';

class AddScreenWidgets {

  TextButton alertBoxTextButton(Text buttonText, Function() onPressed) {
    return TextButton(
        onPressed: onPressed,
    child: buttonText,
    );
  }

}