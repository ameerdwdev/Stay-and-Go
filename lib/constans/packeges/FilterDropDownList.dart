import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stay_go/view/pages/FilterPage.dart';

import '../../controller/FilterPageController.dart';
import '../../controller/HomePageController.dart';
import '../colors.dart';

class FilterAppTextField extends StatefulWidget {
  // final TextEditingController textEditingController;
  // final String title;
  // final String hint;
  // final bool isCitySelected;
 // final List<SelectedListItem>? cities;

  // final String? Option ;

  const FilterAppTextField({
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<FilterAppTextField> {

  @override

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          "Cities",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [ SelectedListItem(name: 'As-Sweida'),
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
          SelectedListItem(name: 'Hama'),],
        selectedItems: (List<dynamic> selectedList)  {
          // print(selectedList.indexed);
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              Future.delayed(Duration(seconds: 1),() => Get.to(() => FilterPage(item: item.name)),);

            }
          }
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: IconButton(
          onPressed: () {
            onTextFieldTap();
          },
          icon: const Icon(
            Icons.filter_alt_outlined,
            size: 30,
          ),
        ),
      )
    ]);
  }
}
