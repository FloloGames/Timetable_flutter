import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,
    {int timeInSeconds = 1}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: timeInSeconds),
    ),
  );
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
