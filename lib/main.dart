import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_go/view/pages/Add.dart';
import 'package:stay_go/view/pages/FilterPage.dart';
import 'package:stay_go/view/pages/HomePage.dart';
import 'package:stay_go/view/pages/LoginPage.dart';
import 'package:stay_go/view/pages/OnBoarding.dart';
import 'package:stay_go/view/pages/Profile.dart';
import 'package:stay_go/view/pages/SignUp.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser == null)?const OnBoarding():HomePage(),
      getPages: [
        GetPage(name: "/login", page: () => const LoginPage()),
        GetPage(name: "/onboarding", page: () => const OnBoarding()),
        GetPage(name: "/signup", page: () => SignUpPage()),
        GetPage(name: "/home", page:()=> HomePage()),
        GetPage(name: "/add", page: ()=>Add()),
        GetPage(name: "/profile", page: ()=>Profile()),
      ],
    );
  }
}
