import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/components/identify.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/text.dart';
import 'package:smart_pay/reusables/textfield.dart';
import 'package:smart_pay/reusables/titletext.dart';
import 'package:smart_pay/theme/app_colors.dart';

class Recovery extends StatefulWidget {
  const Recovery({super.key});

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 54),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SvgPicture.asset("assets/icons/lock.svg", width: 44, height: 44,),
          SizedBox(height: 38),
          Titletext(text: "Password Recovery"),
          SizedBox(height: 12),
          Ntext(text: "Enter your registered email below to receive password instructions"),
          SizedBox(height: 32),
          AppTextField(controller: emailController, hintText: "Email Address"),
          SizedBox(height: 32),
            GestureDetector(onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Identify(),),);
            },
                child: AppButton(title: "Send me an Email")),
        ],),
      )),
    );
  }
}
