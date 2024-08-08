

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController{
  bool notification = false;
  bool ? loading ;
  int? numberOfOffer ;
  List data = [];
  bool? nulldata = true;
  CollectionReference post = FirebaseFirestore.instance.collection('post');
  getdata() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("post")
      .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      data.addAll(querySnapshot.docs);
    } catch (e) {
      print("$e========================================");
    }
  }

  logOut()async{
    await FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    Get.offAllNamed("/login");
  }
  @override
  void onInit() async{
    loading= true;
    nulldata=false;
    await getdata();
    print(data.length);
    if(data.length!=0){
      loading=false;
      update();
    }
    else{
      nulldata=true;
      update();
    }
    super.onInit();
  }
  void onChange(bool value , int i)async{
    loading = true;
    update();
    await post.doc( data[i].id).update({
      "done" : value
    });
    data=[];
    await getdata();
    loading= false;
    update();
  }
}