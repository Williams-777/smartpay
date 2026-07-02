import 'package:flutter/material.dart';
import 'package:smart_pay/components/sign_in.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/appbar.dart';
import 'package:smart_pay/reusables/text.dart';
import 'package:smart_pay/reusables/textfield.dart';
import 'package:smart_pay/reusables/titletext.dart';
import 'package:smart_pay/theme/app_colors.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      appBar: AppBar(leadingWidth: 90,
        backgroundColor: AppColors.textwhite,
        leading: const AppBarIcon(),),
      body: SafeArea(child: Column(children: [
        Titletext(text: "Create a password"),
        SizedBox(height: 12),
        Ntext(text: 'Please, enter a new password below different from the previous password'),
        SizedBox(height: 32),
        AppTextField(controller: passwordController,obscureText: true, hintText: "Enter Password"),
        SizedBox(height: 16),
        AppTextField(controller: confirmpasswordController,obscureText: true, hintText: "Confirm Password"),
        SizedBox(height: 331),
        GestureDetector(onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  SignIn(),),);
        },
            child: AppButton(title: "Create a new password")),
      ],)),
    );
  }
}
