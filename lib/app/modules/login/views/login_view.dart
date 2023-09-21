import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:gameon/app/widgets/login_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Hero(
            tag: "CloudLottie",
            child: Lottie.asset(
              "assets/lotties/cloud.json",
              width: Get.width,
              repeat: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 25,
              left: 25,
              top: 60,
              bottom: 20,
            ),
            child: Hero(
              tag: "LogoLottie",
              child: Image.asset(
                "assets/images/login.jpeg",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Enter Phone Number",
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ContinueButton(
                  onTap: controller.login,
                  text: "Continue",
                ),
                const SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing you agree to our",
                    style: Get.textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: " Terms of Service ",
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "and",
                        style: Get.textTheme.titleMedium!.copyWith(),
                      ),
                      TextSpan(
                        text: " Privacy Policy. ",
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Get.theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
