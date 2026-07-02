import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'other.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height,
    this.width,
    this.title,
    this.child,
    this.onPressed,
    this.color
  });

  final double? height;
  final double? width;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: height ?? 56.h,
        width: width ?? 327.w,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: child ??
            Center(
              child: KText(
                inputText: title ?? '',
              ),
            ),
      ),
    );
  }
}