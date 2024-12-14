import 'package:flutter/material.dart';

class CustomElevatedButtonIcon extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color brandColorText;

  const CustomElevatedButtonIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.brandColorText,
    this.borderRadius = 10.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        icon: icon,
        label: Text(
          label,
          style: TextStyle(color: brandColorText),
        ),
      ),
    );
  }
}
