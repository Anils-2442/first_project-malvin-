import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malavan/view/enfants.dart';

import 'country_weight_controller.dart';

class Posology extends StatelessWidget {
  final String country, weight, method;
  final CountryWeightController doseController = Get.find();

  Posology({super.key, required this.country, required this.weight, required this.method});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (doseController.selectedDoseDetails.value.isEmpty) {
        doseController.fetchDoseDetails(weight);
      }
    });

    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Posology"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            final doseDetails = doseController.selectedDoseDetails.value;
            print("Dose details in Obx: $doseDetails");
        
            // Display a loading indicator while fetching data
            if (doseDetails.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
        
            // Ensure doseDetails has necessary keys
            if (!doseDetails.containsKey('im_dose_mg') ||
                !doseDetails.containsKey('im_dose_ml') ||
                !doseDetails.containsKey('iv_dose_mg') ||
                !doseDetails.containsKey('iv_dose_ml')) {
              return Center(child: Text('Error: Dose details missing'));
            }
        
            final doseMg = method == "IM" ? doseDetails['im_dose_mg'] : doseDetails['iv_dose_mg'];
            final doseMl = method == "IM" ? doseDetails['im_dose_ml'] : doseDetails['iv_dose_ml'];
        
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
        
                Container(
                  height: 75,
                  child: Image.asset(
                    method == "IM"
                        ? "assets/images/im1.png"
                        : "assets/images/iv1.png",
                    scale: 2.5,
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: Row(
                    children: [
                      SizedBox(width: 2),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Updated border radius
                          gradient: LinearGradient(
                            colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                          ),
                        ),
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text(
                            "Dose \n (ml)",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Updated border radius
                          gradient: LinearGradient(
                            colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                          ),
                        ),
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text(
                            "Dose \n (mg)",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:2),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 140,
                      child: Center(
                        child: Text(
                          "HO\n1st injection",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 80,
                      child: Center(
                        child: Text(
                          doseMg.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 80,
                      child: Center(
                        child: Text(
                          doseMl.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:2),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 140,
                      child: Center(
                        child: Text(
                          "H12\n2nd injection",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:1),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 80,
                      child: Center(
                        child: Text(
                          doseMg.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width:1),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 80,
                      child: Center(
                        child: Text(
                          doseMl.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:2),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 140,
                      child: Center(
                        child: Text(
                          "H24\n3rd injection",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 80,
                      child: Center(
                        child: Text(
                          doseMg.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5), // Updated border radius
                        gradient: LinearGradient(
                          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
                        ),
                      ),
                      height: 80,
                      width: 80,
                      child: Center(
                        child: Text(
                          doseMl.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            );
        
          }),
        ),
      ),
      bottomSheet: GestureDetector(onTap: () {
        Get.to(Enfants(country: country, weight: weight, method: method));
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
