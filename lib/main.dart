import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gameon/app/data/repositories/user_repository.dart';
import 'package:gameon/app/data/services/auth_service.dart';
import 'package:gameon/firebase_options.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/routes/app_pages.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthService());

  //Put Repositories
  Get.create(() => UserRepository());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 20,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          selectedItemColor: Colors.black.withOpacity(0.75),
          unselectedItemColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(4),
            overlayColor: MaterialStatePropertyAll(Colors.blue.shade400),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
            ),
          ),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          space: 0,
          color: Colors.grey.shade300,
        ),
        listTileTheme: const ListTileThemeData(
          minLeadingWidth: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.blue,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
      ),
    ),
  );
}
