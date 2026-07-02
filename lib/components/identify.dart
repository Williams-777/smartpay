import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/components/create_password.dart';
import 'package:smart_pay/components/recoverable.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/text.dart';
import 'package:smart_pay/reusables/textfield.dart';
import 'package:smart_pay/reusables/titletext.dart';
import 'package:smart_pay/theme/app_colors.dart';

class Identify extends StatefulWidget {
  const Identify({super.key});

  @override
  State<Identify> createState() => _IdentifyState();
}

class _IdentifyState extends State<Identify> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 54),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/icons/profile.svg", width: 44, height: 44,),
            SizedBox(height: 38),
            Titletext(text: "Verify Your Identity"),
            SizedBox(height: 12),RecoveryOption(
              title: 'Email',
              subtitle: 'A******@mail.com',
              icon: Icons.email_outlined,
              selected: true,
            ),
            Ntext(text: "Where would you like Smartpay to send your security code?"),
            SizedBox(height: 53),
            AppTextField(controller: emailController, hintText: "Email Address"),
            SizedBox(height: 315),
            GestureDetector(onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  CreatePassword(),),);
            },
                child: AppButton(title: "Continue")),
          ],),
      )),
    );
  }
}
