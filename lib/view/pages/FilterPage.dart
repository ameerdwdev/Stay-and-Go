import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_go/constans/colors.dart';
import 'package:stay_go/controller/FilterPageController.dart';

import '../widget/Post.dart';
import 'Details.dart';

class FilterPage extends StatelessWidget {
  FilterPageController controller = Get.put(FilterPageController());
   FilterPage({super.key, required this.item});
  final String item;
  @override
  Widget build(BuildContext context) {
    controller.item=item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title:  Text(
          "Offers in $item ",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
   body: GetBuilder<FilterPageController>(
     init: FilterPageController(),
     builder: (controller)=>
     controller.loading==true?Center(
       child: (controller.nulldata==true)?Text("No offers"):CircularProgressIndicator(color: MyColors.primary,),
     ):
         Padding(
             padding: EdgeInsets.all(0),
             child: ListView.builder(
           itemCount: controller.data.length,
           itemBuilder: (context, index) =>
               InkWell(
                 onTap: (){
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

   ),
    );
  }
}
