import 'package:flutter/material.dart';
import 'package:ui_kit/theme/colors.dart';
import 'package:ui_kit/theme/icons.dart';
import 'package:ui_kit/theme/styles.dart';

class Search extends StatefulWidget {
  final String? hintText;
  final ValueChanged<String> onChanged;

  const Search({this.hintText, required this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final TextEditingController _editingController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _editingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onClear() {
    _editingController.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _editingController,
      focusNode: _focusNode,
      cursorColor: AppColors.accent,
      cursorWidth: 2.0,
      cursorHeight: 20.0,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.textRegular(color: AppColors.inputIcon),
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
        prefixIcon: const Icon(AppIcons.search, color: AppColors.description),
        suffixIcon: _focusNode.hasFocus
            ? IconButton(
                onPressed: _onClear,
                icon: const Icon(AppIcons.close, color: AppColors.description),
              )
            : null,
      ),
      onChanged: widget.onChanged,
    );
  }
}
