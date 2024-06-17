import 'package:flutter/material.dart';
import 'package:flutter_practise/src/fonts/font_manager.dart';
import 'package:flutter_practise/src/styles/text_styles_app.dart';

class OutlinedButtonApp extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool hasBorder;
  double? borderWidth;
  final Color? colorText;
  final Color? borderColor;
  final Color? bgColor;
  final double? fontSizeText;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? paddingButton;
  bool isLoading;
  final bool enable;
  final Color? disableColor;
  final OutlinedBorder? shape;

  OutlinedButtonApp({
    Key? key,
    this.onPressed,
    required this.label,
    this.hasBorder = true,
    this.colorText,
    this.borderWidth,
    this.borderColor,
    this.bgColor,
    this.fontSizeText,
    this.labelStyle,
    this.paddingButton,
    this.isLoading = false,
    this.enable = true,
    this.disableColor,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading || !enable ? null : onPressed,
      clipBehavior: Clip.antiAlias,
      style: OutlinedButton.styleFrom(
        side: !hasBorder
            ? const BorderSide(color: Colors.transparent)
            : BorderSide(
                width: borderWidth ?? 1,
                color: borderColor ?? Colors.transparent,
              ),
        backgroundColor: enable ? bgColor ?? Colors.white : disableColor ?? const Color(0xFFBABABA),
        padding: paddingButton,
        shape: shape,
      ),
      child: Align(
        alignment: Alignment.center,
        child: isLoading
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2),
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: labelStyle ?? TextStylesApp.bold(color: colorText ?? const Color(0xFF2A56BD), fontSize: fontSizeText ?? FontSizeApp.s18),
              ),
      ),
    );
  }
}
