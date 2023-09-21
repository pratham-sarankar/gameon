import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameon/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/2413/2413074.png",
                    height: 25),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/3135/3135707.png",
                    height: 25),
                label: "Profile",
              ),
            ],
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.changeIndex(value);
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: [
              _buildHomeView(),
              const ProfileView(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHomeView() {
    return Scaffold(
      body: Center(
        child: Text("Coming Soon"),
      ),
    );
  }
}
