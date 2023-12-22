import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color backgroundColor = Colors.white,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
  ));
}

void showErrorSnackBar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  ));
}
