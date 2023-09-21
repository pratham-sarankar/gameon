import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/loading_controller.dart';

class LoadingView extends GetView<LoadingController> {
  const LoadingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: Get.width),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: Get.width * 0.55,
                width: Get.width * 0.55,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.black,
                ),
              ),
              CircleAvatar(
                radius: Get.width * 0.25,
                backgroundImage: const AssetImage("assets/images/loading.jpeg"),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  controller.text,
                  speed: const Duration(milliseconds: 50),
                  textAlign: TextAlign.center,
                  textStyle: Get.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
