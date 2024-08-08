
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MessagesController extends GetxController{
 List data = [];
 bool loading = true;
  getData()async{
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("message").where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      data.addAll(querySnapshot.docs);
    } catch (e) {
      print("$e========================================");
    }
  }
  @override
  void onInit() {
    data = [];
    getData();
    loading=false;
    Future.delayed(Duration(seconds: 2),() => update());
    super.onInit();
  }
}