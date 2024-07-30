import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malavan/view/vials.dart';
import 'vials.dart';
import 'country_weight_controller.dart';




class Admin extends StatelessWidget {
  final String country ,weight;

   const Admin({super.key, required this.country, required this.weight});

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Route of Administration"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(onTap: () {
              Get.to(Vials(country: country,weight:weight,method:"IM",), );
            },
              child: Image.asset(
                "assets/images/im.png",
                height: 140,
                width: 280,
              ),
            ),
            GestureDetector(onTap: () {
              Get.to(Vials(country:country,weight: weight,method: "IV",));
            },
              child: Image.asset(
                "assets/images/iv.png",
                height: 140,
                width: 280,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
