import 'package:flutter/material.dart';
import 'package:ui_kit/theme/colors.dart';
import 'package:ui_kit/theme/icons.dart';
import 'package:ui_kit/theme/styles.dart';

class ModalBottomSheet extends StatelessWidget {
  final String title;

  const ModalBottomSheet({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsetsGeometry.fromLTRB(20, 24, 50, 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    style: AppTextStyles.secondTitleExtraBold(),
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(AppIcons.close),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
