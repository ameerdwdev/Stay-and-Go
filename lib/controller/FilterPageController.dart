import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FilterPageController extends GetxController {
  late String item;

  bool? loading;

  bool? nulldata = false;
  List data = [];

  getdata() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("post")
          .where("city", isEqualTo: item)
          .get();
      data.addAll(querySnapshot.docs);
    } catch (e) {
      print("$e========================================");
    }
  }

  @override
  void onReady() async {
    print("$item===================================");
    await getdata();
    ///////////////////////////////////////////////////////////done
    if (data.length == 0) {
      nulldata = true;
      update();
    } else if(data.length!=0) {
      loading = false;
      update();
    }
    super.onReady();
  }

  @override
  void onInit() {
    loading = true;
    super.onInit();
  }
}
