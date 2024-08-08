import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Company extends StatelessWidget {
  const Company({super.key, required this.url, required this.name});
  final String url ;
  final String name ;
  @override
  Widget build(BuildContext context) {
    return
        Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        child: Column(
          children: [
            Container(
                height: 200,
                child: Image.network(url,
                    fit: BoxFit.fill)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
               " $name",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        height: 250,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            ),
      ),
    );
  }
}
