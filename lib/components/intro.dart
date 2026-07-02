import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay/components/create_pin.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/appbar.dart';
import 'package:smart_pay/reusables/textfield.dart';
import 'package:smart_pay/theme/app_colors.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final passwordController = TextEditingController();
  final fullName = TextEditingController();
  final userName = TextEditingController();
  Country? selectedCountry;

  bool get _isFormComplete =>
      fullName.text.trim().isNotEmpty &&
          userName.text.trim().isNotEmpty &&
          passwordController.text.trim().isNotEmpty &&
          selectedCountry != null;

  @override
  void dispose() {
    fullName.dispose();
    userName.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    fullName.addListener(() => setState(() {}));
    userName.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      appBar: AppBar(leadingWidth: 90,
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
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      fontFamily: "Inter-Regular"
                  ),
                  children: [
                    const TextSpan(
                      text: 'Tell us a bit about \n',
                    ),
                    TextSpan(
                      text: 'yourself.',
                      style: TextStyle(
                        color: AppColors.links,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter-Medium",
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              AppTextField(controller: fullName, hintText: "Full Name"),
              SizedBox(height: 16),
              AppTextField(controller: userName, hintText: "UserName"),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: false,
                    onSelect: (Country country) {
                      setState(() {
                        selectedCountry = country;
                      });
                    },
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 56,
                  width: 327,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.bgwhite,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      if (selectedCountry != null) ...[
                        Text(selectedCountry!.flagEmoji),
                        const SizedBox(width: 8),
                        Text(selectedCountry!.name),
                      ] else
                        const Text(
                          'Select Country',
                          style: TextStyle(
                            color: AppColors.hint,
                          ),
                        ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.hint,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              AppTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 24),
              AppButton(
                title: "Continue",
                color: _isFormComplete
                    ? AppColors.primary
                    : AppColors.tColor,
                onPressed: _isFormComplete
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pin(),
                    ),
                  );
                }
                    : null,
              ),
              SizedBox(height: 244,)
            ],),
          ),
        ),
      ),
    );
  }
}
