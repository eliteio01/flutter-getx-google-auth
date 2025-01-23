import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessSnackBar(String title, String message) {
  Get.snackbar(
    '',
    '',
    titleText: Row(
      children: [
        Icon(Icons.check_circle, color: Colors.white),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    snackStyle: SnackStyle.FLOATING,
    borderRadius: 8,
    margin: EdgeInsets.all(10),
    icon: Icon(Icons.check_circle_outline, size: 36, color: Colors.white),
    shouldIconPulse: true,
    animationDuration: Duration(milliseconds: 500),
    duration: Duration(seconds: 3),
  );
}
