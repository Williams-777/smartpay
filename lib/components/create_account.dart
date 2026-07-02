import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/components/sign_in.dart';
import 'package:smart_pay/components/verify.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/appbar.dart';
import 'package:smart_pay/reusables/body_text.dart';
import 'package:smart_pay/reusables/text.dart';
import 'package:smart_pay/reusables/textfield.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/reusables/titletext.dart';

class Account extends StatefulWidget {
  Account({super.key});

  @override
  State<Account> createState() => _AccountState();

}

class _AccountState extends State<Account> {
  bool _hasText = false;
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      setState(() {
        _hasText = emailController.text.trim().isNotEmpty;
      });
    });
  }
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      appBar: AppBar(leadingWidth: 81,
        backgroundColor: AppColors.textwhite,
        leading: const AppBarIcon(),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Create a ',
                    ),
                    TextSpan(
                      text: 'Smartpay \n',
                      style: TextStyle(
                        color: AppColors.links,
                      ),
                    ),
                    const TextSpan(
                      text: 'account',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              AppTextField(controller: emailController, hintText: "Email"),
              SizedBox(height: 24),
              AppButton(
                title: "Sign Up",
                color: _hasText
                    ? AppColors.primary
                    : AppColors.tColor,
                onPressed: _hasText
                    ? () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Verify(),
                    ),
                  );
                }
                    : null,
              ),
              SizedBox(height: 32),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/line.png"),
                    Ntext(text: "OR"),
                    Image.asset("assets/images/line.png"),
                  ],
                ),
              SizedBox(height: 24),
              Row(children: [
                Container(
                  width: 150,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.textwhite,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffE5E7EB),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/google.svg', width: 24, height: 24,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 150,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.textwhite,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffE5E7EB),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/apple.svg', width: 24, height: 24,
                    ),
                  ),
                ),
              ],),
              SizedBox(height: 117),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Btext(text: "Already have an account? "),
                GestureDetector(onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SignIn(),),);
                },
                    child: Titletext(text: "Sign In", color: AppColors.links, fontSize: 16,)),
              ],),
              SizedBox(height: 152),
            ],),
          ),
        ),
      )
    );
  }
}
