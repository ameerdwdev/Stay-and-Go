import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  int index = 0;
  bool? loading;
  late String ilterItem;

  //////////////////////////////////////////////////get
  List data = [];

  getdata() async {
    if (index == 0) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("post")
            .where(
              "done",
              isEqualTo: false,
            )
            .where("type", isEqualTo: "Home")
            .get();
        data.addAll(querySnapshot.docs);
      } catch (e) {
        print("$e========================================");
      }
    } else if (index == 1) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("post")
            .where(
              "done",
              isEqualTo: false,
            )
            .where("type", isEqualTo: "Car")
            .get();
        data.addAll(querySnapshot.docs);
      } catch (e) {
        print("$e========================================");
      }
    } else {
      try {
        QuerySnapshot querySnapshot =
            await FirebaseFirestore.instance.collection("company").get();
        data.addAll(querySnapshot.docs);
      } catch (e) {
        print("$e========================================");
      }
    }
    update();
  }

  @override
  void onInit() async {
    data = [];
    loading = true;
    update();
    await getdata();
    print("done ==========================================");
    loading = false;
    update();
    super.onInit();
  }
}
