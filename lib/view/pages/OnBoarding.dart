import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constans/colors.dart';
import '../../constans/onboarding/Body.dart';
import '../../constans/onboarding/Images.dart';
import '../../controller/OnBoardingController.dart';
import '../widget/OnBoardingButton.dart';

class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.black,
              ),
              const Text("Stay &",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25)),
              Text(
                " Go",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                    fontSize: 25),
              ),
              Icon(
                Icons.speed_sharp,
                color: MyColors.primary,
              )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (val) {
                    controller.onPageChanged(val);
                  },
                  itemCount: BoardingImages.myImage.length,
                  itemBuilder: (context, i) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Image.asset(
                              BoardingImages.myImage[i],
                              width: 350,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            BoardingBody.myBody[i],
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  GetBuilder<OnBoardingController>(
                      builder: (controller) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                  BoardingImages.myImage.length,
                                  (index) => AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        width: controller.currentIndex == index
                                            ? 30
                                            : 8,
                                        height: 8,
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: MyColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ))
                            ],
                          )),
                  const SizedBox(
                    height: 30,
                  ),
                  OnBoardingButton(
                      text: 'Next',
                      onPressed: () {
                        controller.next();
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
