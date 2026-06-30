import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';


class AppTextField extends StatefulWidget {
  AppTextField({
    super.key,
    required this.controller, required this.hintText, this.keyboardType,this.obscureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.hintText.toLowerCase().contains("password");
  }

  @override
  Widget build(BuildContext context) {
    final isPasswordField = widget.hintText.toLowerCase().contains("password");
    return SizedBox(height: 56.h, width: 327,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: isPasswordField? _obscure: false,
        cursorColor: AppColors.primary,
        obscuringCharacter: ".",
        style:TextStyle(
            fontSize: 16.spMin,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.bgwhite,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          hintStyle: TextStyle(
              fontSize: 16.spMin,
              color: AppColors.hint,
              fontWeight: FontWeight.w400,
              fontFamily: "Inter",
          ),
          suffixIcon: isPasswordField ?
          GestureDetector(
              onTap: (){
                setState(() {
                  _obscure =!_obscure;
                });
              },
              child: Icon(_obscure?Icons.visibility_off:Icons.visibility, color: AppColors.tColor,)) : null,
          border: OutlineInputBorder(
            borderSide: BorderSide( color: AppColors.bgwhite),
            borderRadius: BorderRadius.circular(16.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.skipcolor),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}

