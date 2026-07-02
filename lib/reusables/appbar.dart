import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/theme/app_colors.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key});

  static const double totalWidth = 81;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 41),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.textwhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffE5E7EB)),
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/exit.svg'),
            ),
          ),
        ),
      ),
    );
  }
}