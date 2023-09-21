import 'package:gameon/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //Put controllers
    //Note: Don't use lazy put here, it will cause an error.
    Get.put<HomeController>(HomeController());
    Get.put<ProfileController>(ProfileController());
  }
}
