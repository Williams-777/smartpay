import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_pay/reusables/app_buttons.dart';
import 'package:smart_pay/reusables/text.dart';
import '../theme/app_colors.dart';
import 'sign_in.dart';
import '../reusables/titletext.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<_OnboardData> _pages = [
    _OnboardData(
      imageWidth: 300,
      imageHeight: 480,
      builder: (context) => Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/phone1.png',
                    width: 202,
                    height: 407,
                  ),
                ),
                Positioned(
                  left: 92,
                  top: 152,
                  child: SvgPicture.asset("assets/images/deposit.svg"),
                ),
                Positioned(
                  right: 100,
                  top: 229,
                  child: SvgPicture.asset("assets/images/graph.svg"),
                ),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Titletext(text: "Finance app the safest and most trusted"),
                SizedBox(height: 16),
                Ntext(text: "Your finance work starts here. Our here to help you track and deal with speeding up your transactions."),
              ],
            ),
          ),
        ],
      ),
    ),
    _OnboardData(
      imageWidth: 270,
      imageHeight: 410,builder: (context) => Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/phone2.png',
                  width: 202,
                  height: 407,
                ),
              ),
              Positioned(
                left: 131,
                top: 183,
                child: SvgPicture.asset("assets/images/contact.svg"),
              ),
              Positioned(
                right: 107,
                top: 86,
                child: SvgPicture.asset("assets/images/masterclass.svg"),
              ),
            ],
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(color: AppColors.textwhite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Titletext(text: "Fastest Transaction Process only here"),
                SizedBox(height: 16),
                Ntext(text: "Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient."),
              ],
            ),
          ),
        ),
      ],
    ),
    ),
  ];
  void _goToSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textwhite,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Center(
              child: GestureDetector(
                onTap: _goToSignIn,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter-Bold",
                    color: AppColors.skipcolor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: Column(
                      children: [
                        SizedBox(
                          width: page.imageWidth,
                          height: page.imageHeight,
                          child: page.builder(context),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 4,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: GestureDetector(
                onTap: _goToSignIn,
                child: AppButton(title: "Get Started"),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _OnboardData {
  final double imageWidth;
  final double imageHeight;
  final WidgetBuilder builder;


  _OnboardData({
    required this.imageWidth,
    required this.imageHeight,
    required this.builder,
  });
}










