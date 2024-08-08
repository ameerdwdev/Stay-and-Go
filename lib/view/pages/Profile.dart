import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:stay_go/constans/colors.dart';
import 'package:stay_go/controller/ProfileController.dart';

import '../widget/PostProfile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Card(
                              child: GetBuilder<ProfileController>(
                        init: ProfileController(),
                        builder: (controller) => SwitchListTile(
                          activeColor: MyColors.primary,
                          activeTrackColor: MyColors.primary,
                         // secondary: Icon(Icons.notifications),
                          title: Text(
                            "Notification",
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                          value: controller.notification,
                          onChanged: (bool value) {
                            controller.notification = value;
                            controller.update();
                          },
                        ),
                      ))),
                      PopupMenuItem(
                          child: Card(
                        child: ListTile(
                          trailing: Icon(Icons.logout,color: MyColors.primary,size: 30,),
                          onTap: () {
                            PanaraInfoDialog.show(
                              context,

                              //title: "Hello",
                              message: "Are you sure ?",
                              buttonText: "Yes ",

                              onTapDismiss: () {
                                controller.logOut();
                              },
                              panaraDialogType: PanaraDialogType.custom,
                              color: MyColors.primary,
                              barrierDismissible: false, // optional parameter (default is true)
                            );
                          },
                          title: Text("Log out", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                        ),
                      )),
                    ])
            // InkWell(
            //   onTap: () async {
            //     await controller.logOut();
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.fromLTRB(0, 14, 5, 0),
            //     child: Text(
            //       "Log out ",
            //       style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // )
          ],
          title: const Text("My profile"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: MyColors.primary,
        ),
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) => controller.loading == true
              ? Center(
                  child: (controller.nulldata == true)
                      ? Text("you don't have offers")
                      : CircularProgressIndicator(
                          color: MyColors.primary,
                        ),
                )
              : Column(
                  children: [
                    Container(
                        height: 240,
                        width: 400,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyColors.primary,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                              "images/profile.png",
                              width: 150,
                              height: 150,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  EvaIcons.person,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${controller.data[0]["username"]}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          width: 250,
                          height: 60,
                          decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Text(
                              "you have ${controller.data.length} offers",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "   My offers",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 2,
                          width: 250,
                          color: Colors.black,
                          child: const Text(" "),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(15),
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) => Card(
                            child: Row(
                              children: [
                                Expanded(flex: 3,
                                  child: PostProfile(
                                          title: "${controller.data[index]["title"]}",
                                          price: controller.data[index]["price"],
                                          done: controller.data[index]["done"],
                                      type: controller.data[index]["type"],
                                      onChanged: (bool value) {
                                            controller.onChange(value, index);
                                      },
                                        ),
                                ),
                                Container(width: 2,height: 70,color: MyColors.primary,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: IconButton(onPressed: (){PanaraInfoDialog.show(
                                    context,

                                    title: controller.data[0]["username"],
                                    message: "Delete this offer ?",
                                    buttonText: "Yes ",

                                    onTapDismiss: ()async {
                                      await FirebaseFirestore.instance.collection("post").doc(controller.data[index].id).delete();
                                      if(controller.data[index]['url1']!= null)
                                        await FirebaseStorage.instance.refFromURL(controller.data[index]['url1']).delete();
                                      if(controller.data[index]['url2']!= null)
                                        await FirebaseStorage.instance.refFromURL(controller.data[index]['url2']).delete();
                                      if(controller.data[index]['url3']!= null)
                                        await FirebaseStorage.instance.refFromURL(controller.data[index]['url3']).delete();
                                      Get.to(Profile());
                                      controller.data=[];
                                      controller.onInit();
                                    },
                                    panaraDialogType: PanaraDialogType.custom,
                                    color: MyColors.primary,
                                    barrierDismissible: true, // optional parameter (default is true)
                                  );}, icon: Icon(Icons.delete,color: MyColors.primary,size: 35,)),
                                ),
                              ],
                            ),
                          ),
                          ),
                    )
                  ],
                ),
        ));
  }
}
