import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/components/confirmation.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/appbar.dart';
import 'package:smart_pay/reusables/text.dart';
import 'package:smart_pay/reusables/titletext.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Pin extends StatefulWidget {
  const Pin({super.key});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  bool _isPinComplete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      appBar: AppBar(leadingWidth: 90,
        backgroundColor: AppColors.textwhite,
        leading: const AppBarIcon(),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Titletext(text: "Set your pin code"),
              SizedBox(height: 12,),
              Ntext(text: "We use state-of-the-art security measures to protect your information at all times"),
              SizedBox(height: 32,),
              Center(
                child: Pinput(
                  length: 5,
                  obscureText: true,
                  obscuringCharacter: '●',
                  keyboardType: TextInputType.number,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 60,
                    textStyle: const TextStyle(fontSize: 24),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.skipcolor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 50,
                    height: 60,
                    textStyle: const TextStyle(fontSize: 24),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isPinComplete = value.length == 5;
                    });
                  },
                ),
              ),
              SizedBox(height: 123,),
              AppButton(
                title: "Create PIN",
                color: _isPinComplete
                    ? AppColors.primary
                    : AppColors.tColor,
                onPressed: _isPinComplete
                    ? () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Confirm(),),);
                }
                    : null,
              )

            ],),
          ),
        ),
      ),
    );
  }
}
