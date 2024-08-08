import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddController extends GetxController {
  String? username;
  String? url1;
  String? url2;
  String? url3;
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController price = TextEditingController();

  File? file1;
  File? file2;
  File? file3;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile?> images = await picker.pickMultiImage();
    // final XFile? image2 = await picker.pickImage(source: ImageSource.gallery);
    // final XFile? image3 = await picker.pickImage(source: ImageSource.gallery);
    file1 = File(images[0]!.path);
    file2 = File(images[1]!.path);
    file3 = File(images[2]!.path);
    //Add name to each image
    var imagename1 = basename(file1!.path);
    var imagename2 = basename(file2!.path);
    var imagename3 = basename(file3!.path);
    //take the url
    var ref1 = FirebaseStorage.instance.ref(imagename1);
    var ref2 = FirebaseStorage.instance.ref(imagename2);
    var ref3 = FirebaseStorage.instance.ref(imagename3);

    await ref1.putFile(file1!);
    await ref2.putFile(file2!);
    await ref3.putFile(file3!);

    url1 = await ref1.getDownloadURL();
    url2 = await ref2.getDownloadURL();
    url3 = await ref3.getDownloadURL();

    update();
  }

  /////////////////////////////////////////////////////////getdata to know the username
  List data = [];
  getdata() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo:FirebaseAuth.instance.currentUser!.uid )
          .get();
      data.addAll(querySnapshot.docs);
    } catch (e) {
      print("$e========================================");
    }
  }
  ////////////////////////////////onInit
  @override
  void onInit() {
    getdata();
    print("done get===============================");
    super.onInit();
  }

  //////////////////////////////////////////////////////FireStore

  CollectionReference post = FirebaseFirestore.instance.collection('post');

  Future<void> addPost() {
    // Call the user's CollectionReference to add a new Post
    return post
        .add({
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'email': FirebaseAuth.instance.currentUser!.email,
          'title': title.text,
          'discraption': des.text,
          'type': type.text,
          'done': false,
          'city': city.text,
          'phone': phone.text,
          'price': price.text,
          'url1': url1,
          'url2': url2,
          'url3': url3,
          'username': data[0]['username']
        })
        .then((value) => print(" post Add =================="))
        .catchError((error) => print("Failed to add user: $error"));
  }


}
