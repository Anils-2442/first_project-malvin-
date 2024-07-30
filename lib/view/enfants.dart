import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'country_weight_controller.dart';
import 'adults.dart';

class Enfants extends StatelessWidget {
  final String country, weight, method;
  final CountryWeightController doseController = Get.find();

  Enfants({
    super.key,
    required this.country,
    required this.weight,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
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
                "ENFANTS",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "Cofantrine"),
              Tab(text: "Lufantrine"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabContent('cofantrine_dipersible', 'cofantrine_suspension'),
            _buildTabContent('lufanter_dispersible', 'lufanter_suspension'),
          ],
        ),
        bottomSheet: GestureDetector(
          onTap: () {
            Get.to(Adults(country: country, weight: weight, method: method));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String cofantrine_dipersible, String lufanter_dispersible) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildContentSection("Dipersible", cofantrine_dipersible),
            SizedBox(height: 70),  // Reduced height
            _buildContentSection("Suspension", lufanter_dispersible),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection(String title, String priceKey) {
    return Column(
      children: [
        Center(child: _buildTabletContainer(title)),
        SizedBox(height: 3),  // Reduced height
        _buildDaysRow(),
        SizedBox(height:3),  // Reduced height
        _buildHoursRow(),
        SizedBox(height:3),  // Reduced height
        _buildDosageRow(),
        SizedBox(height:3),  // Reduced height
        Obx(() {
          final details = doseController.selectedCountryDetails.value;
          final price = details?[priceKey] ?? 'n/a';
          return Text(
            "Recommended price: $price ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          );
        }),
      ],
    );
  }

  Widget _buildTabletContainer(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
        ),
      ),
      height: 40,
      width: 250,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDaysRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSmallBox("Day 1"),
        SizedBox(width:2),
        _buildSmallBox("Day 2"),
        SizedBox(width:2),
        _buildSmallBox("Day 3"),
      ],
    );
  }

  Widget _buildHoursRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  Widget _buildDosageRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTinyBox("5-14\n kg"),
        SizedBox(width: 1),
        _buildTinyBox("1cp"),
        SizedBox(width: 1),
        _buildTinyBox("1cp"),
        SizedBox(width: 1),
        _buildTinyBox("1cp"),
        SizedBox(width: 1),
        _buildTinyBox("1cp"),
        SizedBox(width: 1),
        _buildTinyBox("1cp"),
        SizedBox(width: 1),
        _buildTinyBox("1cp"),
      ],
    );
  }

  Widget _buildSmallBox(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
        ),
      ),
      height: 40,
      width: 82.20,
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
        gradient: LinearGradient(
          colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)],
        ),
      ),
      height: 40,
      width: 41.50,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }
}
