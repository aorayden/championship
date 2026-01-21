import 'package:flutter/material.dart';

class SelectItem {
  final String value;
  final String text;
  final IconData? icon;
  final Color? iconColor;

  const SelectItem({
    required this.value,
    required this.text,
    this.icon,
    this.iconColor,
  });
}
