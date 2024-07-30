import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'adolescents.dart';
import 'country_weight_controller.dart';

class Adults extends StatelessWidget {
  final String country;
  final String weight;
  final String method;
  final CountryWeightController doseController = Get.find();

  Adults({
    super.key,
    required this.country,
    required this.weight,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (doseController.selectedCountryDetails.value != country) {
        doseController.fetchCountryDetails(country);
      }
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Realy treatment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              Text(
                "ADULTS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            onTap: (index) {
              String medication = index == 0 ? "Cofantrine" : "Lufantrine";

              doseController.selectedCountryDetails.value;
            },
            tabs: [
              Tab(text: "Cofantrine"),
              Tab(text: "Lufantrine"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabContent("COFANTRINE ADULTES", "Cofantrine"),
            _buildTabContent("lufanter_sachets", "Lufantrine"),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String tabTitle, String medication) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
              ),
              height: 40,
              width: 251,
              child: Center(
                child: Text(
                  tabTitle,
                  style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildSmallBox("DAY1"),
                SizedBox(width: 1),
                _buildSmallBox("DAY2"),
                SizedBox(width: 1),
                _buildSmallBox("DAY3"),
              ],
            ),
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTinyBox("oh"),
                SizedBox(width: 1),
                _buildTinyBox("8h"),
                SizedBox(width: 1),
                _buildTinyBox("Mor"),
                SizedBox(width: 1),
                _buildTinyBox("Eve"),
                SizedBox(width: 1),
                _buildTinyBox("Mor"),
                SizedBox(width: 1),
                _buildTinyBox("Eve"),
              ],
            ),
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTinyBox(">35kg"),
                SizedBox(width: 1),
                _buildTinyBox(medication == "Cofantrine" ? "1cp" : "SAC"),
                SizedBox(width: 1),
                _buildTinyBox(medication == "Cofantrine" ? "1cp" : "SAC"),
                SizedBox(width: 1),
                _buildTinyBox(medication == "Cofantrine" ? "1cp" : "SAC"),
                SizedBox(width: 1),
                _buildTinyBox(medication == "Cofantrine" ? "1cp" : "SAC"),
                SizedBox(width: 1),
                _buildTinyBox(medication == "Cofantrine" ? "1cp" : "SAC"),
                SizedBox(width: 1),
                _buildTinyBox(medication == "Cofantrine" ? "1cp" : "SAC"),
              ],
            ),
            SizedBox(height: 5),
            Obx(() {
              final details = doseController.selectedCountryDetails.value;
              final price = details?[medication == "Cofantrine" ? 'cofantrine_adultes' : 'lufanter_sachets'] ?? 'n/a';
              return Text(
                "Recommended price: $price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              );
            }),
            // SizedBox(height: 344),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(Colors.blue),
            //       minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
            //       padding: MaterialStateProperty.all(EdgeInsets.all(12.0)),
            //     ),
            //     onPressed: () {
            //       Get.to(Adolescents(country: country, weight: weight, method: method));
            //     },
            //     child: Text(
            //       'Continue',
            //       style: TextStyle(
            //         fontWeight: FontWeight.w800,
            //         fontSize: 18,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallBox(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
      ),
      height: 40,
      width: 83,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTinyBox(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
      ),
      height: 40,
      width: 41,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }
}
