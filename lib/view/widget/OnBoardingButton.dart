import 'package:flutter/material.dart';
import 'package:stay_go/constans/colors.dart';

class OnBoardingButton extends StatelessWidget {
  final String? text;

  final void Function()? onPressed;

  const OnBoardingButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        elevation: 5,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: MyColors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Text(
            "$text",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
