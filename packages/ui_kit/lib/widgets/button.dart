import 'package:flutter/material.dart';
import 'package:ui_kit/models/button_enums.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonKind kind;
  final ButtonVariant variant;
  final TextStyle? textStyle;

  const Button({
    required this.text,
    this.onPressed,
    this.kind = ButtonKind.big,
    this.variant = ButtonVariant.primary,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  double? _getWidth() {
    switch (kind) {
      case ButtonKind.big:
        return double.infinity;
      case ButtonKind.small:
        return 96.0;
      case ButtonKind.chip:
        return null;
    }
  }

  double _getHeight() {
    switch (kind) {
      case ButtonKind.big:
        return 56.0;
      case ButtonKind.small:
        return 40.0;
      case ButtonKind.chip:
        return 48.0;
    }
  }

  EdgeInsets _getPadding() {
    switch (kind) {
      case ButtonKind.big:
        return const EdgeInsets.symmetric(horizontal: 16.0);
      case ButtonKind.small:
        return EdgeInsets.only(
          top: 26.0,
          right: 20.0,
          bottom: 26.0,
          left: 20.0,
        );
      case ButtonKind.chip:
    }
  }
}
