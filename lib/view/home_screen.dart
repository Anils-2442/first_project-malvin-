import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malavan/view/country_weight_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/malavin2.png',
              width: 200,
              height: 100,
            ),
            SizedBox(width:10),
            Image.asset(
              'assets/images/malavin3.png',
              height: 100,
              width: 200,
            ),
            SizedBox(width:10),
            Image.asset(
              'assets/images/malavin4.png',
              width: 200,
              height: 100,
            ),


          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          // borderRadius: BorderRadius.only(
          //   bottomRight: Radius.circular(8.0), // Top-left radius
          //   bottomLeft: Radius.circular(8.0), // Top-right radius
          // ),
        ),

        child: GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CountryWeightScreen(),));
        },
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height:16),
              Text(
                'Start Dose Calculation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          
            ],),
        ),
      ),
    );
  }
}
