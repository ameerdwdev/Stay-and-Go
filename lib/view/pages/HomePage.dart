import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:stay_go/constans/packeges/FilterDropDownList.dart';
import 'package:stay_go/controller/HomePageController.dart';
import 'package:stay_go/controller/ProfileController.dart';
import 'package:stay_go/view/pages/Details.dart';
import 'package:stay_go/view/pages/FilterPage.dart';
import 'package:stay_go/view/pages/Messages.dart';
import 'package:stay_go/view/widget/Company.dart';
import '../../constans/colors.dart';
import '../widget/Post.dart';
import 'Send.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //String? name   = FirebaseAuth.instance.currentUser!.displayName;
  //String? number = FirebaseAuth.instance.currentUser!.phoneNumber;

  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) => (controller.index == 2)
            ? FloatingActionButton(
                onPressed: () {
                  Get.to(Messages());
                },
                child: Icon(Icons.email),
                backgroundColor: MyColors.primary,
              )
            : FloatingActionButton(
                onPressed: () {
                  Get.toNamed("/add");
                  Get.delete<HomePageController>();
                },
                backgroundColor: MyColors.primary,
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
      ),
      body: GetBuilder<HomePageController>(
          init: HomePageController(),
          builder: (controller) => CustomScrollView(
                slivers: [
                  SliverAppBar(
                    actions: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed("/profile");
                          Get.delete<HomePageController>();
                        },
                        icon: const Icon(
                          EvaIcons.personOutline,
                          size: 30,
                        ),
                      ),
                      FilterAppTextField(),
                      // IconButton(
                      //   onPressed: () {},
                      //   tooltip: "Filter",
                      //   icon: const Icon(
                      //     Icons.filter_alt_outlined,
                      //     size: 30,
                      //   ),
                      //   color: Colors.white,
                      // ),
                      IconButton(
                          onPressed: () {
                            controller.data = [];
                            controller.onInit();
                          },
                          icon: Icon(
                            EvaIcons.refresh,
                            size: 30,
                          )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                    title: const Text(
                      "Home Page ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    flexibleSpace: const FlexibleSpaceBar(),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    // pinned: true,
                    floating: true,
                    // title: Text("Home Page",style: TextStyle(color: Colors.black),),
                    expandedHeight: 60,
                    backgroundColor: MyColors.primary,
                  ),
                  (controller.loading == true)
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (context, index) => Center(
                            child: CircularProgressIndicator(
                              color: MyColors.primary,
                            ),
                          ),
                        ))
                      : (controller.index == 2)
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate(
                              childCount: controller.data.length,
                              (context, index) => InkWell(
                                  onTap: () {
                                    Get.to(Send(
                                      data: controller.data[index],
                                    ));
                                  },
                                  child: Company(
                                    url: '${controller.data[index]['url']}',
                                    name:
                                        '${controller.data[index]['companyName']}',
                                  )),
                            ))
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                              childCount: controller.data.length,
                              (context, index) => InkWell(
                                onTap: () {
                                  Get.to(Details(data: controller.data[index]));
                                },
                                child: Post(
                                  username: controller.data[index]["username"],
                                  city: controller.data[index]["city"],
                                  url1: controller.data[index]["url1"],
                                  url2: controller.data[index]["url2"],
                                  url3: controller.data[index]["url3"],
                                  title: controller.data[index]["title"],
                                ),
                              ),
                            ))
                ],
              )),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (i) {
          controller.loading = true;
          controller.update();
          controller.data = [];
          controller.index = i;
          controller.data = [];
          controller.getdata();
          controller.loading = false;
          controller.update();
        },
        height: 60,
        buttonBackgroundColor: MyColors.primary,
        color: MyColors.primary,
        backgroundColor: Colors.white,
        items: const [
          Icon(
            EvaIcons.home,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            EvaIcons.car,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.home_repair_service,
            size: 35,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
