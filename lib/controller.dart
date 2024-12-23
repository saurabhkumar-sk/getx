import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prac/model.dart';
import 'package:http/http.dart' as http;

class ExploreController extends GetxController {
  var dropDownValue = ["Name", "ID"].obs;
  RxString selectedType = 'Name'.obs;

  RxBool isLoading = false.obs;

  var searchController = TextEditingController().obs;
  Rx<ExploreModel?> exploreModel = Rx<ExploreModel?>(null);

  Future<void> getExploreData(String query) async {
    isLoading.value = true;

    final Uri url =
        Uri.parse("https://urlsdemo.net/burmese/api/explore-screen-user");

    try {
      final response = await http.post(
        url,
        body: {
          'name': query,
        },
        headers: {
          'Authorization':
              'Bearer 1738|tevxJmdy1rlUPwq3APL3LFo7CfLoJjMfYcY7q2fCbb7e0a00',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        exploreModel.value = ExploreModel.fromJson(responseData);

        if (kDebugMode) {
          print(
              "Success: ${response.statusCode} Data Count: ${exploreModel.value?.data?.length}");
        }
      } else {
        if (kDebugMode) {
          print("Error: ${response.statusCode}: ${response.body}");
        }
        exploreModel.value = null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Exception: $e");
      }
      exploreModel.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  void onSearch(String query) {
    getExploreData(searchController.value.text);
  }

  void updateDropDown(String type) {
    selectedType.value = type;
    getExploreData(searchController.value.text);
  }

  @override
  void onClose() {
    searchController.value.dispose();
    super.onClose();
  }
}
