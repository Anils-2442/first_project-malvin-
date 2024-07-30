import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malavan/view/admin.dart';


import 'country_weight_controller.dart';

class CountryWeightScreen extends StatefulWidget {
  @override
  State<CountryWeightScreen> createState() => _CountryWeightScreenState();
}

class _CountryWeightScreenState extends State<CountryWeightScreen> {
  final CountryWeightController doseController = Get.put(CountryWeightController());
  bool isWeightSelected = false;
  bool isCountrySelected = false;

  @override
  void initState() {
    super.initState();
    doseController.fetchDocumentIds();
    doseController.fetchCountryNames();
    print(doseController.fetchDocumentIds);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Reset data in controller when navigating back
        // doseController.resetData();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Country & Weight'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 140,),
            Padding(
              padding: const EdgeInsets.only(right:200),
              child: Center(
                child: Text(
                  "Country",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  readOnly: true,
                  controller: doseController.countryController,
                  onTap: () {
                    _showCountryBottomSheet(context);
                  },
                  decoration: InputDecoration(
                    labelText: 'Select Country',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 120),
              child: Center(
                child: Text(
                  "Weight of Patient",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  readOnly: true,
                  controller: doseController.weightController,
                  onTap: () {
                    _showWeightBottomSheet(context);
                  },
                  decoration: InputDecoration(
                    labelText: 'Select Weight',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 225),

            if (isWeightSelected && isCountrySelected)
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    minimumSize: MaterialStateProperty.all(
                        Size(double.infinity, 30)), // Set the minimum size
                    padding: MaterialStateProperty.all(
                        EdgeInsets.all(12.0)), // Optional: Set padding
                  ),
                  onPressed: () {
                    Get.to(Admin(
                      country:
                      doseController.selectedCountryDetails.value.toString(),
                      weight:
                      doseController.selectedDoseDetails.value.toString(),

                    ));
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
        bottomSheet: isWeightSelected && isCountrySelected ? GestureDetector(
          onTap: () {
            Get.to(Admin(
              country:
              doseController.selectedCountryDetails.value.toString(),
              weight:
              doseController.selectedDoseDetails.value.toString(),

            ));
          },
          child: Padding(
            padding: const EdgeInsets.only(left:10,right:10,bottom:10),
            child: Container(
              height: 50, // Height for the button area
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
        ) : null,
      ),
    );
  }

  void _showWeightBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: ListView.builder(
            itemCount: doseController.documentIds.length,
            itemBuilder: (context, index) {
              String docId = doseController.documentIds[index];
              return ListTile(
                title: Center(
                  child: Text(
                    docId,
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {
                  setState(() {
                    isWeightSelected = true;
                    isCountrySelected = doseController.selectedCountryId.value !=
                        null; // Check if country is also selected
                  });
                  doseController.selectedDocId.value = docId;
                  doseController.fetchDoseDetails(docId);
                  doseController.weightController.text = docId;
                  Get.back();
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showCountryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: ListView.builder(
            itemCount: doseController.countryNames.length,
            itemBuilder: (context, index) {
              String countryId = doseController.countryNames[index];
              return ListTile(
                title: Center(child: Text(countryId)),
                onTap: () {
                  setState(() {
                    isCountrySelected = true;
                    isWeightSelected = doseController.selectedDocId.value !=
                        null; // Check if weight is also selected
                  });
                  doseController.selectedCountryId.value = countryId;
                  doseController.fetchCountryDetails(countryId);
                  doseController.countryController.text = countryId;
                  print(doseController.selectedCountryId.value);
                  Get.back();
                },
              );
            },
          ),
        );
      },
    );
  }
}
