
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class KText extends StatelessWidget {
  const KText({
    super.key,  required this.inputText, this.size,  this.textColor, this.weight, this.fontFamily,
  });

  final String inputText;
  final double? size;
  final Color? textColor;
  final FontWeight? weight;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: TextStyle(
        fontSize: size ?? 16.spMin ,
        color: textColor ?? AppColors.textwhite,
        fontWeight: weight?? FontWeight.w700,
        fontFamily: fontFamily ?? "Inter",
      ),
    );
  }
}

class LolTile extends StatelessWidget {
  const LolTile({
    super.key, required this.name, required this.backgroundColor, required this.height, required this.width,
  });

  final String name;
  final double height;
  final double width;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return KText(inputText: name, size: 24.spMin,);
  }
}


SizedBox h( double height) {
  return SizedBox(height: height.h);
}
SizedBox w( double width) {
  return SizedBox(width: width);
}

