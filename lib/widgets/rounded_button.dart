import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double elevation;
  final IconData? icon;
  final double iconSize;

  const RoundedButton({
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.width = double.infinity,
    this.height = 48.0,
    this.elevation = 2.0,
    this.icon,
    this.iconSize = 20.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: textColor, fontSize: 16);

    return Semantics(
      button: true,
      label: title,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: elevation,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: icon == null
              ? Text(title, style: textStyle)
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor, size: iconSize),
              const SizedBox(width: 8),
              Text(title, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}