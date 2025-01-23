import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showFailedSnackBar(String title, String message) {
  Get.snackbar(
    '',
    '',
    titleText: Row(
      children: [
        const Icon(Icons.error, color: Colors.white),
        const SizedBox(width: 8),
        Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    snackStyle: SnackStyle.FLOATING,
    borderRadius: 8,
    margin: const EdgeInsets.all(10),
    icon: const Icon(Icons.error_outline, size: 36, color: Colors.white),
    shouldIconPulse: true,
    animationDuration: Duration(milliseconds: 500),
    duration: Duration(seconds: 3),
  );
}
