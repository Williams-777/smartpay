import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/appbar.dart';
import 'package:smart_pay/reusables/text.dart';
import 'package:smart_pay/reusables/titletext.dart';
import 'package:smart_pay/theme/app_colors.dart';

class Confirm extends StatelessWidget {
  const Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Image.asset("assets/images/thumbs_up.png", width: 140, height: 135,),
        SizedBox(height: 32),
        Titletext(text: "Congratulations James"),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Ntext(text: "You’ve completed the onboarding, you can start using", textAlign: TextAlign.center,),
        ),
        SizedBox(height: 32,),
        AppButton(title: "Get Started"),
      ],),
    );
  }
}
