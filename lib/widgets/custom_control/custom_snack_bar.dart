import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show({required BuildContext context, required Widget content}) {
    SnackBar snackBar = SnackBar(content: content);

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
