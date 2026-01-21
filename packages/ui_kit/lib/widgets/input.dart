import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ui_kit/theme/colors.dart';
import 'package:ui_kit/theme/icons.dart';
import 'package:ui_kit/theme/styles.dart';

class Input extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final String inputFormatter; //* 'password' или маска.
  final AutovalidateMode autovalidateMode;
  final String? Function(String?)? validator;

  const Input({
    this.labelText,
    this.hintText,
    this.errorText,
    this.validator,
    this.initialValue = '',
    this.inputFormatter = '',
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  late final TextEditingController _editingController;
  MaskTextInputFormatter? _maskFormatter;
  bool _obscureText = false;

  bool get _isPasswordField => widget.inputFormatter == 'password';

  @override
  void initState() {
    super.initState();

    _editingController = TextEditingController(text: widget.initialValue ?? '');

    if (!_isPasswordField && widget.inputFormatter.isNotEmpty) {
      _maskFormatter = MaskTextInputFormatter(
        mask: widget.inputFormatter,
        filter: {'-': RegExp(r'[0-9]')},
        initialText: widget.initialValue,
        type: MaskAutoCompletionType.lazy,
      );
    }

    _obscureText = _isPasswordField;
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  String? _internalValidator(String? value) {
    if (widget.validator != null) {
      return widget.validator!(value);
    }

    if (value == null || value.trim().isEmpty) {
      return widget.errorText;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: _editingController.text,
      autovalidateMode: widget.autovalidateMode,
      validator: _internalValidator,
      builder: (FormFieldState<String> state) {
        final bool hasError = state.hasError;
        final Color fillColor = hasError
            ? AppColors.error.withValues(alpha: 0.10)
            : AppColors.inputBackground;
        final Color borderColor = hasError
            ? AppColors.error
            : AppColors.inputStroke;
        final Color focusedColor = hasError
            ? AppColors.error
            : AppColors.accent;

        final List<TextInputFormatter> inputFormatters = [
          if (_maskFormatter != null) _maskFormatter!,
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8.0,
          children: [
            if (widget.labelText != null) ...[
              Text(widget.labelText!, style: AppTextStyles.captionRegular()),
            ],
            TextFormField(
              controller: _editingController,
              onChanged: (value) {
                state.didChange(value);
              },
              obscureText: _isPasswordField ? _obscureText : false,
              obscuringCharacter: '*',
              inputFormatters: inputFormatters,
              cursorColor: AppColors.accent,
              cursorWidth: 2.0,
              cursorHeight: 20.0,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppTextStyles.textRegular(
                  color: AppColors.inputIcon,
                ),
                filled: true,
                fillColor: fillColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: borderColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: focusedColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.error),
                ),
                suffixIcon: _isPasswordField
                    ? IconButton(
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                        icon: Icon(
                          _obscureText ? AppIcons.closeEye : AppIcons.openEye,
                          color: AppColors.black,
                        ),
                        tooltip: _obscureText ? 'Показать' : 'Скрыть',
                      )
                    : null,
              ),
            ),
            if (hasError) ...[
              Text(
                state.errorText ?? '',
                style: AppTextStyles.textRegular(color: AppColors.error),
              ),
            ],
          ],
        );
      },
    );
  }
}
