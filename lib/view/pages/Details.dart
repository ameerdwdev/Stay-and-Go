import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stay_go/constans/colors.dart';


class Details extends StatelessWidget {

  var data;

  Details({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(children: [
            Text("The details of the", style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),),
            Text(" ${data["type"]}", style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColors.primary),),
          ],),
          leading: IconButton(onPressed: (){
    Get.back();
    }, icon: Icon(Icons.arrow_back, color: MyColors.primary, size: 40,),),
    ),
    body: ListView(
    padding: EdgeInsets.all(15),
    children: [
    SizedBox(height: 10,),
    Container(
    height: 200,
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text("${data["discraption"]}",style: TextStyle(fontSize: 16,),),
    ),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(width: 2,color: MyColors.primary),

    ),

    ),
    SizedBox(height: 20,),
    Row(children: [
    Icon(Icons.location_on_outlined,color: MyColors.primary,),
    Text(" ${data["city"]}",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
    ],),
    SizedBox(height: 15,),
    Row(children: [
    Icon(Icons.money_outlined,color: MyColors.primary,)
    ,Text(" Monthly price:${data["price"]}",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
    ],),
    SizedBox(height: 30,),
    Row(
    children: [
    const Text(
    "To communicate",
    style: TextStyle(fontSize:16 ,fontWeight: FontWeight.bold),
    ),
    const SizedBox(
    width: 10,
    ),
    Container(
    height: 2,
    width: 170,
    color: Colors.black,
    child: const Text(" "),
    ),
    ],
    ),
    SizedBox(height: 20,),
    Row(
    children: [
    Icon(Icons.email_outlined,color: MyColors.primary,),
    Text(" ${data["email"]}",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
    ],
    ),
    SizedBox(height: 20,),
    Row(
    children: [
    Icon(Icons.phone,color: MyColors.primary,),
    Text(" ${data["phone"]}",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
    ],
    ),
    ],
    ),
    );
  }
}
