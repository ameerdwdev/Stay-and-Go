import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stay_go/controller/AddController.dart';
import 'package:stay_go/view/widget/MyButton.dart';
import 'package:stay_go/view/widget/PhoneNum.dart';
import 'package:stay_go/view/widget/TextFormDes.dart';

import '../../constans/colors.dart';
import '../../constans/packeges/DropDownList.dart';
import '../widget/TestForm.dart';

class Add extends StatelessWidget {
  Add({super.key});

  final AddController controller = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Post",
                style: TextStyle(
                    fontSize: 25,
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: ()async {
             await controller.addPost();
             Get.delete<AddController>();
             Get.offAllNamed('/home');
            },
          ),
          const SizedBox(
            width: 8,
          )
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: MyColors.primary,
        ),
        title: const Text(
          "Add offer",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(
            height: 10,
          ),
          MyTestForm(
            hint: 'Enter your offer title',
            icon: const Icon(Icons.title),
            label: 'Title',
            mycontroller: controller.title,
          ),
          const SizedBox(
            height: 20,
          ),
          MyTestFormDes(
              hint:
                  "Enter the description ,\n the area of home, or the year of production of the car, \n the location of the home ",
              icon: const Icon(Icons.description_outlined),
              label: "Description",
              mycontroller: controller.des),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: AppTextField(
              cities: [
                SelectedListItem(name: 'As-Sweida'),
                SelectedListItem(name: 'Lattakia'),
                SelectedListItem(name: 'Damascus'),
                SelectedListItem(name: 'Tartous'),
                SelectedListItem(name: 'Rural Damascus'),
                SelectedListItem(name: 'Al-Hasakeh'),
                SelectedListItem(name: "Dar'a"),
                SelectedListItem(name: 'Quneitra'),
                SelectedListItem(name: 'Ar-Raqqa'),
                SelectedListItem(name: 'Idleb'),
                SelectedListItem(name: 'Aleppo'),
                SelectedListItem(name: 'Homs'),
                SelectedListItem(name: 'Hama'),
              ],
              textEditingController: controller.city,
              title: "Cities",
              hint: " Tap to select the city",
              isCitySelected: true,
              Option: 'Cities',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: AppTextField(
              cities: [
                SelectedListItem(
                  name: 'Home',
                ),
                SelectedListItem(name: 'Car'),
              ],
              textEditingController: controller.type,
              title: "Types",
              hint: "Tap to select the Type",
              isCitySelected: true,
              Option: 'Typs',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PhoneNum(
              hint: "Enter your phone number",
              icon: const Icon(Icons.phone_rounded),
              label: "Phone number",
              mycontroller: controller.phone),
          const SizedBox(
            height: 25,
          ),
          PhoneNum(
              hint: "monthly price in Syrian pound",
              icon: const Icon(Icons.price_change),
              label: "Price",
              mycontroller: controller.price),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              elevation: 4,
              onPressed: () async {
                await controller.getImage();
                controller.update();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: MyColors.grey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Choose three Pictures "),
                    Icon(
                      Icons.photo,
                      color: MyColors.primary,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
        GetBuilder<AddController>(
            init: AddController(),
            builder: (controller)=> Container (
           child :(controller.url1 == null ||
                  controller.url2 == null ||
                  controller.url3 == null)
              ? const Icon(
                  Icons.error,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.done_outline,
                  color: Colors.green,
                )))
        ],
      ),
    );
  }
}
