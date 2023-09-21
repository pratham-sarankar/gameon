import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gameon/app/data/repositories/user_repository.dart';
import 'package:gameon/app/routes/app_pages.dart';

class AuthService extends GetxService {
  bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;

  String get userId => FirebaseAuth.instance.currentUser!.uid;

  Stream<User?> streamUser() {
    return FirebaseAuth.instance.userChanges();
  }

  Future<UserCredential?> verifyOtp(String verificationId, String otp) async {
    late UserCredential userCredentials;
    try {
      final credentials = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      Get.toNamed(Routes.LOADING, arguments: "Logging in...");
      userCredentials =
          await FirebaseAuth.instance.signInWithCredential(credentials);
    } catch (e) {
      return null;
    }
    await Get.find<UserRepository>().updateUser(userCredentials.user!);
    return userCredentials;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
