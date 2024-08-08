
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:stay_go/constans/colors.dart';
import 'package:stay_go/view/widget/MyButton.dart';
import 'package:stay_go/view/widget/TestForm.dart';
import '../../controller/LoginController.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            const Text(
              "Log",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              "in",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary),
            ),
            Icon(
              Icons.login,
              color: MyColors.primary,
              size: 30,
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Image.asset(
            "images/login.jpg",
            width: 200,
            height: 175,
          ),
          const Text(
            "Login by your E_mail or use \n your google account",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MyTestForm(
              hint: "Enter your E_mail",
              icon: const Icon(Icons.email_outlined),
              label: "E_mail",
              mycontroller: controller.email),
          const SizedBox(
            height: 30,
          ),
          MyTestForm(
              hint: "Enter your password",
              icon: const Icon(Icons.lock_outline),
              label: "Password",
              mycontroller: controller.password),
           InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text("  Forget password ? ",style: TextStyle(color: MyColors.primary),),
            ),
            onTap: (){
              controller.resetPassword();
              PanaraInfoDialog.show(
                context,

                //title: "Hello",
                message: "A link has been sent to your email to change your password",
                buttonText: "Okay ",

                onTapDismiss: () {
                  Get.back();
                },
                panaraDialogType: PanaraDialogType.warning,
                color: MyColors.primary,
                barrierDismissible: false, // optional parameter (default is true)
              );
            },
          ),
          const SizedBox(
            height: 25 ,
          ),
          MyButton(
              text: "Log in",
              onPressed: () async {
                await controller.Login();
              }),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: MaterialButton(
                elevation: 2,
                onPressed: () async{
                 await controller.googlesign();
                 await controller.addUser();
                 Get.offAllNamed("/home");
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color:Colors.white,
                child: Image.asset("images/google.png")),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.offAllNamed("/signup");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have account ?  ",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Sing Up",
                  style: TextStyle(
                      color: MyColors.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
