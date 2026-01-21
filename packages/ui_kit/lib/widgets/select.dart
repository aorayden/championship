import 'package:flutter/material.dart';
import 'package:ui_kit/models/select_item.dart';
import 'package:ui_kit/theme/colors.dart';
import 'package:ui_kit/theme/icons.dart';
import 'package:ui_kit/theme/styles.dart';

class Select extends StatelessWidget {
  final List<SelectItem> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final VoidCallback onTap;
  final String? hintText;

  const Select({
    required this.items,
    required this.onChanged,
    required this.onTap,
    this.selectedValue,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DropdownButtonFormField<String>(
        initialValue: selectedValue,
        key: ValueKey(selectedValue),
        icon: const Icon(AppIcons.chevronDown, color: AppColors.description),
        hint: hintText != null
            ? Text(
                hintText!,
                style: AppTextStyles.textRegular(color: AppColors.inputIcon),
              )
            : null,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.inputBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.inputStroke),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.inputStroke),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.inputStroke),
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item.value,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item.icon != null) ...[
                  Icon(item.icon, color: item.iconColor),
                  const SizedBox(width: 6),
                ],
                Text(item.text, style: AppTextStyles.textRegular()),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
