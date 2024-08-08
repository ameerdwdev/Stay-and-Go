import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;
  final String? Option ;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key, required this.Option,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();

}

class _AppTextFieldState extends State<AppTextField> {
  @override

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle:  Text(
          "${widget.Option}",
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
        data: widget.cities ?? [
        ],
        selectedItems: (List<dynamic> selectedList) {
          print(selectedList.indexed);
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
              widget.textEditingController.text=item.name;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(widget.title),
        // const SizedBox(
        //   height: 5.0,
        // ),
        TextFormField(

          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(widget.title),
              ),
              suffixIconColor: MyColors.primary,
              focusColor: MyColors.primary,
              hintText: widget.textEditingController.text==""? widget.hint:widget.textEditingController.text,
              suffixIcon: const Icon(Icons.location_on_outlined),
              labelStyle: TextStyle(color: MyColors.primary),
              floatingLabelBehavior: FloatingLabelBehavior.always,

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.primary, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
