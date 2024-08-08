import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stay_go/constans/colors.dart';

class PostProfile extends StatelessWidget {
   PostProfile({super.key,required this.title,required this.price,required this.done,required this.type,required this.onChanged});
  var title = " ";
  var price = " ";
  bool done;
  var type ;
   void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SwitchListTile(
          secondary: Icon(
            (type=="Home")? Icons.home:EvaIcons.car,
            size: 40,
            color: MyColors.primary,
          ),
          activeTrackColor: MyColors.primary,
          activeColor: MyColors.primary,
          title: Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
          ),
          subtitle: Text(
            "$price S.P",
            style: TextStyle(),
          ),
          value: done,
          onChanged: (bool value) {
            onChanged!(value);
          },
        ),
      ),
    );
  }
}
