import 'package:flutter/material.dart';

class PlusJakartaSansStyle {
  static TextStyle getStyle({
    required int weight,
    String uniquifier = 'default',
    double fontSize = 16.0,
    Color color = Colors.black,
    bool italic = false,
  }) {
    if (weight < 200 || weight > 800 || weight % 100 != 0) {
      throw ArgumentError('Weight must be a multiple of 100 between 200 and 800');
    }

    return TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.values.firstWhere(
            (w) => w.value == weight,
        orElse: () => FontWeight.w400, // Default to 400 if exact match not found
      ),
      fontSize: fontSize,
      color: color,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    );
  }
}