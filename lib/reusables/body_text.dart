import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Btext extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;

  const Btext({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? "Inter",
        color: color ?? AppColors.hint,
      ),
    );
  }
}