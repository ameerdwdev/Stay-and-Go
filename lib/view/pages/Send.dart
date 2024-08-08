import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_go/constans/colors.dart';

import '../widget/MyButton.dart';
import '../widget/TextFormDes.dart';

class Send extends StatelessWidget {
  TextEditingController problem = TextEditingController();
  TextEditingController address = TextEditingController();

  Send({super.key, this.data});

  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: Text('${data['companyName']}'),
      ),
      body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${data['des']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MyTestFormDes(
              hint: 'describe your problem precisely ',
              icon: Icon(Icons.home_repair_service_rounded),
              label: 'the problem',
              mycontroller: problem,
            ),
            SizedBox(
              height: 30,
            ),
            MyTestFormDes(
              hint: 'put your address precisely',
              icon: Icon(Icons.location_on),
              label: 'the Address',
              mycontroller: address,
            ),
            SizedBox(
              height: 30,
            ),
            IconButton(onPressed:() {}, icon: Icon(Icons.add_a_photo,color: MyColors.primary,size: 40,)),
            SizedBox(
              height: 30,
            ),
            MyButton(
              text: 'Send',
              onPressed: () {
                CollectionReference message = FirebaseFirestore.instance.collection('message');

                Future<void> addMessage() {
                  // Call the user's CollectionReference to add a new user
                  return message
                      .add({
                    'uid': FirebaseAuth.instance.currentUser!.uid,
                    'cid':data['id'],
                    'problem': problem.text,
                    'address':address.text,
                    'accept' : false ,
                    'date': " ",

                  })
                      .then((value) => print("User Added"))
                      .catchError((error) => print("Failed to add user: $error"));
                }
                addMessage();
                Get.back();
              },
            )
          ],
        ),
    );
  }
}
