import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'adolescents.dart';
import 'country_weight_controller.dart';

class Adolescents extends StatelessWidget {
  final String country;
  final String weight;
  final String method;
  final CountryWeightController doseController = Get.find();

  Adolescents({
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
                "Adolescents/Adults",
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
            _buildTabContent(tabTitle: "cofantrine_b/24",
                addExtraRows: true,
                isLufantrine: false),
            _buildTabContent(tabTitle: "lufanter_b/12",
                addExtraRows: false,
                isLufantrine: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(
      {required String tabTitle, required bool addExtraRows, required bool isLufantrine}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
              ),
              height: 40,
              width: 251,
              child: Center(
                child: Text(
                  tabTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.white),
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
            ),
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTinyBox("15-24\n kg"),
                SizedBox(width: 1),
                _buildTinyBox("2cp"),
                SizedBox(width: 1),
                _buildTinyBox("2cp"),
                SizedBox(width: 1),
                _buildTinyBox("2cp"),
                SizedBox(width: 1),
                _buildTinyBox("2cp"),
                SizedBox(width: 1),
                _buildTinyBox("2cp"),
                SizedBox(width: 1),
                _buildTinyBox("2cp"),
              ],
            ),
            if (!isLufantrine) ...[
              SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildTinyBox("25-34\n kg"),
                  SizedBox(width: 1),
                  _buildTinyBox("3cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("3cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("3cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("3cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("3cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("3cp"),
                ],
              ),
            ],
            if (!isLufantrine) ...[
              SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildTinyBox(">35kg"),
                  SizedBox(width: 1),
                  _buildTinyBox("4cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("4cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("4cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("4cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("4cp"),
                  SizedBox(width: 1),
                  _buildTinyBox("4cp"),
                ],
              ),
            ],
            SizedBox(height: 5),
            Obx(() {
              final details = doseController.selectedCountryDetails.value;
              final priceKey = isLufantrine ? 'lufanter_b/12' : 'cofantrine_b/24';
              final price = details?[priceKey] ?? 'n/a';
              return Text(
                "Recommended price: $price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallBox(String tech) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
      ),
      height: 40,
      width: 83,
      child: Center(
        child: Text(
          tech,
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTinyBox(String promena) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            colors: [Color(0xFFB3C5E7), Color(0xFF9CABBE)]),
      ),
      height: 40,
      width: 41,
      child: Center(
        child: Text(
          promena,
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }
}

