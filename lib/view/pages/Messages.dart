import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_go/constans/colors.dart';
import 'package:stay_go/controller/MessagesController.dart';

class Messages extends StatelessWidget {
  Messages({super.key});

  final MessagesController controller = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessagesController>(
        init: MessagesController(),
        builder:(controller) =>
      (controller.loading==true) ?
      Scaffold(appBar: AppBar(
        backgroundColor: MyColors.primary,
        centerTitle: true,
        title: Text("My massages"),
      ),
        body: Center(child: CircularProgressIndicator(color: MyColors.primary,),
        ),
      ) :
      Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            Get.delete<MessagesController>();
            Get.back();

          },),
          backgroundColor: MyColors.primary,
          centerTitle: true,
          title: Text("My massages"),
        ),
        body: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1, color: Colors.black)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${controller.data[index]["problem"]}",style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,),
                      (controller.data[index]["accept"] == false) ? Icon(
                        Icons.access_time_outlined, color: MyColors.primary,
                        size: 40,):
                          Text("We will come in ${controller.data[index]["date"]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: MyColors.primary),)
                    ],
                  ),
                ),
              )
          ,),
      ));
  }
}
