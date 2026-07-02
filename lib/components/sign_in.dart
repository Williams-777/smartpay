import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/components/create_account.dart';
import 'package:smart_pay/components/recovery.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/appbar.dart';
import 'package:smart_pay/reusables/textfield.dart';
import 'package:smart_pay/reusables/titletext.dart';
import 'package:smart_pay/reusables/text.dart';
import 'package:smart_pay/reusables/body_text.dart';
import 'package:smart_pay/theme/app_colors.dart';

class SignIn extends StatefulWidget {
   SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      appBar: AppBar(
        leadingWidth: 90,
        backgroundColor: AppColors.textwhite,
        leading: const AppBarIcon(),),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Titletext(text: "Hi There! 👋"),
            SizedBox(height: 8,),
            Ntext(text: "Welcome back, Sign in to your account"),
            SizedBox(height: 32),
            AppTextField(
              controller: emailController,
              hintText: 'Email',
            ),
            SizedBox(height: 16,),
            AppTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 24),
            GestureDetector(onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Recovery(),),);
            },
                child: Titletext(text: "Forgot Password?", color: AppColors.links, fontSize: 16,)),
            SizedBox(height: 24),
            AppButton(title: "Sign In",),
            SizedBox(height: 32),
            Center(child: Ntext(text: "OR")),
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
            SizedBox(height: 138),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Btext(text: "Don’t have an account? "),
              GestureDetector(onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Account(),),);
              },
                  child: Titletext(text: "Sign Up", color: AppColors.links, fontSize: 16,)),
            ],),
            SizedBox(height: 8),
          ],),
        ),
      ),
    );
  }
}
