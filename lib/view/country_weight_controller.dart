import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CountryWeightController extends GetxController {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  var documentIds = <String>[].obs;
  var selectedDocId = Rxn<String>();
  var selectedDoseDetails = Rx<Map<String, dynamic>>({});
  var countryNames = <String>[].obs;
  var selectedCountryId = Rxn<String>();
  var selectedCountryDetails = Rxn<Map<String, dynamic>>({});


  @override
  void onInit() {
    super.onInit();
    fetchDocumentIds();
    fetchCountryNames();
  }

  Future<void> fetchDocumentIds() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('doses').get();
      documentIds.value = snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print('Error fetching document IDs: $e');
      Get.snackbar('Error', 'Failed to fetch document IDs');
    }
  }

  Future<void> fetchDoseDetails(String docId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('doses').doc(docId).get();
      if (snapshot.exists) {
        selectedDoseDetails.value = Map<String, dynamic>.from(snapshot.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        Get.snackbar('Error', 'Document does not exist');
      }
    } catch (e) {
      print('Error fetching document details: $e');
      Get.snackbar('Error', 'Failed to fetch document details');
    }
  }

  Future<void> fetchCountryNames() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('country').get();
      countryNames.value = snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print('Error fetching country names: $e');
      Get.snackbar('Error', 'Failed to fetch country names');
    }
  }

  Future<void> fetchCountryDetails(String countryId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('country').doc(countryId).get();
      if (snapshot.exists) {
        selectedCountryDetails.value = Map<String, dynamic>.from(snapshot.data() as Map<String, dynamic>);
      //  print('Country details fetched: ${selectedCountryDetails.value}');
      } else {
        print('Country does not exist');
        //Get.snackbar('Error', 'Country does not exist');
      }
    } catch (e) {
      print('Error fetching country details: $e');
      Get.snackbar('Error', 'Failed to fetch country details');
    }
  }

  void resetData() {
    weightController.clear();
    countryController.clear();
    selectedDocId.value = null;
    selectedDoseDetails.value = {};
    selectedCountryId.value = null;
    selectedCountryDetails.value = {};
  }
}
