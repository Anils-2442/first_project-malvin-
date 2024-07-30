import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'country_weight_controller.dart';
import 'reconstitution.dart';

class Vials extends StatelessWidget {
  final String country;
  final String weight;
  final String method;

  final CountryWeightController doseController = Get.find();

  Vials({
    Key? key,
    required this.country,
    required this.weight,
    required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch dose details after the first frame
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (doseController.selectedDoseDetails.value.isEmpty) {
        doseController.fetchDoseDetails(weight);
      }
    });

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Number of vials necessary")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          final doseDetails = doseController.selectedDoseDetails.value;
          print("Dose details in Obx: $doseDetails");

          // Display a loading indicator while fetching data
          if (doseDetails.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          // Ensure doseDetails has necessary keys
          if (!doseDetails.containsKey('per_dose_m30') ||
              !doseDetails.containsKey('per_dose_m60') ||
              !doseDetails.containsKey('per_dose_m120')) {
            return Center(child: Text('Error: Dose details missing'));
          }

          return Column(
            children: [
              SizedBox(height: 40),
              Container(
                height: 75,
                child: Image.asset(
                  method == "IM" ? "assets/images/im1.png" : "assets/images/iv1.png",
                  scale: 2.5,
                ),
              ),
              SizedBox(height: 60),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5), // Added border radius
                ),
                height: 30,
                width: 320,
                child: Center(
                  child: Text(
                    'Number of vials',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.only(right: 53),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
                        borderRadius: BorderRadius.circular(5), // Added border radius
                      ),
                      height: 70,
                      width: 95,
                      child: Center(
                        child: Text(
                          "Per dose",
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 3),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
                        borderRadius: BorderRadius.circular(5), // Added border radius
                      ),
                      height: 70,
                      width: 95,
                      child: Center(
                        child: Text(
                          "For whole\n treatment \n (3 doses)",
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:2),
              Column(
                children: [
                  buildDoseRow("Malavan30", doseDetails['per_dose_m30']?.toString() ?? "n/a", doseDetails['per_treat_m30']?.toString() ?? "n/a", Colors.green),
                  buildDoseRow("Malavan60", doseDetails['per_dose_m60']?.toString() ?? "n/a", doseDetails['per_treat_m60']?.toString() ?? "n/a", Colors.blue),
                  buildDoseRow("Malavan120", doseDetails['per_dose_m120']?.toString() ?? "n/a", doseDetails['per_treat_m120']?.toString() ?? "n/a", Colors.red),
                ],
              ),

            ],
          );
        }),
      ),
      bottomSheet: GestureDetector(onTap: () {
        Get.to(Reconstitution(country: country, weight: weight, method: method));
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

  Widget buildDoseRow(String label, String perDose, String forTreatment, Color color) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5), // Added border radius
              ),
              height: 30,
              width: 95,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 2),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
                borderRadius: BorderRadius.circular(5), // Added border radius
              ),
              height: 30,
              width: 95,
              child: Center(
                child: Text(perDose),
              ),
            ),
            SizedBox(width: 2),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
                borderRadius: BorderRadius.circular(5), // Added border radius
              ),
              height: 30,
              width: 95,
              child: Center(
                child: Text(forTreatment),
              ),
            ),
            SizedBox(width: 2),
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5), // Added border radius
              ),
              height: 30,
              width: 37,
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
        SizedBox(height: 2),
      ],
    );
  }
}
