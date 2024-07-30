import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malavan/view/posology.dart';

class Reconstitution extends StatelessWidget {
  final String country, weight, method;

  const Reconstitution(
      {super.key,
      required this.country,
      required this.weight,
      required this.method});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reconstitution"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            height:75,
            child: Image.asset(
              method == "IM" ? "assets/images/im1.png" : "assets/images/iv1.png",
              scale: 2.5,
            ),
          ),

          Image.asset(
            'assets/images/malavan30.png',
            height: 100,
            width: 200,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Etape 1 : activation",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
                  ),
                  height: 80,
                  width: 180,
                  child: Center(
                      child: Text(
                    "Sodium\nbicarbonate(ml)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  )),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
                  ),
                  height: 80,
                  width: 80,
                  child: Center(child: Text("0.5",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                ),
                
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Slowly check the vial to dissolve the powder",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Etape 2 : Dilution",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
                  ),
                  height: 80,
                  width: 180,
                  child: Center(
                      child: Text(
                    "Sodium\nchloride(ml)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  )),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
                  ),
                  height: 80,
                  width: 80,
                   child: Center(child: Text("1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                ),

              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "When the solution is clear,dilute with \n sodium chloride",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),


        ],
      ),
      bottomSheet: GestureDetector(onTap: () {
        Get.to(Posology(country: country, weight: weight, method: method));
      },
        child: Padding(
          padding: const EdgeInsets.only(left:10,right:10,bottom:10),
          child: Container(
            height: 50, // Height for the button area

            decoration: BoxDecoration(  color: Colors.blue,borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Continue",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
