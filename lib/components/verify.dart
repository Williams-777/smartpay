import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/components/intro.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/appbar.dart';
import 'package:smart_pay/reusables/titletext.dart';
import 'package:smart_pay/theme/app_colors.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  bool _isPinComplete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      appBar: AppBar(leadingWidth: 90,
        backgroundColor: AppColors.textwhite,
        leading: const AppBarIcon(),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Titletext(text: "Verify it's you"),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.tColor,
                  fontFamily: "Inter-Regular"
                ),
                children: [
                  const TextSpan(
                    text: 'We send a code to ',
                  ),
                  TextSpan(
                    text: '( *****@mail.com ).',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter-Medium",
                    ),
                  ),
                  const TextSpan(
                    text: ' Enter it here to verify your identity',
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Pinput(
              length: 5,
              onChanged: (value) {
                setState(() {
                  _isPinComplete = value.length == 5;
                });
              },
              onCompleted: (pin) {
                print(pin);
              },
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color:  AppColors.bgwhite,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.skipcolor),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 32),
            Center(child: Text("Resend Code 30 secs", style: TextStyle(fontFamily: "Inter-Bold", fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xff727272)),)),
            SizedBox(height: 62),
            AppButton(
              title: "Confirm",
              color: _isPinComplete
                  ? AppColors.primary
                  : AppColors.tColor,
              onPressed: _isPinComplete
                  ? () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Intro(),
                  ),
                );
              }
                  : null,
            ),
          ],
          ),
        ),
      ),
    );
  }
}
