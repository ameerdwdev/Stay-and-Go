import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stay_go/constans/colors.dart';

class Post extends StatelessWidget {
  const Post(
      {super.key,
      required this.username,
      required this.city,
      required this.url1,
      required this.url2,
      required this.url3,
      required this.title});

  final String? username;

  final String? city;
  final String? url1, url2, url3;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: MyColors.primary,
                    ),
                    Text(
                      "$username",
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                     Icon(
                      Icons.location_on_outlined,
                      color: MyColors.primary,
                    ),
                    Text(
                      "$city",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("$title"),
                )
              ],
            ),
            Container(
              height: 250,
              child: PageView(
                children: [
                  Image.network(
                    "$url1",
                    fit: BoxFit.fill,
                  ),
                  Image.network(
                    "$url2",
                    fit: BoxFit.fill,
                  ),
                  Image.network(
                    "$url3",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Go to details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: MyColors.primary,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
