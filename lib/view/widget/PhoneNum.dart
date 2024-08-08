import 'package:flutter/material.dart';
import 'package:stay_go/constans/colors.dart';

class PhoneNum extends StatelessWidget {
  final String? hint;

  final String? label;

  final Widget? icon;

  TextEditingController? mycontroller;

  PhoneNum(
      {super.key,
        required this.hint,
        required this.icon,
        required this.label,
        required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: mycontroller,
        decoration: InputDecoration(
            suffixIconColor: MyColors.primary,
            focusColor: Colors.deepOrange,
            hintText: "$hint",
            suffixIcon: icon,
            labelStyle: TextStyle(color: MyColors.primary),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("$label"),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.primary, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
