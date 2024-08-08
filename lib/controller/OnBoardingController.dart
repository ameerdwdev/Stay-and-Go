
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stay_go/view/pages/LoginPage.dart';

import '../constans/onboarding/Images.dart';

class OnBoardingController extends GetxController{
  int currentIndex = 0 ;
   PageController pageController = PageController();

  void onPageChanged(int index){
    currentIndex= index;
    update();
  }
  next (){
    currentIndex++;
    if(currentIndex > BoardingImages.myImage.length - 1){
      Get.offAll(LoginPage());
    }
   pageController.animateToPage(currentIndex, duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
  }

}