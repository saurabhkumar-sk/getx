import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:getx_prac/pagination/pagination_model.dart';

class PaginationController extends GetxController {
  @override
  void onInit() {
    getPaginationData();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  ScrollController scrollController = ScrollController();

  RxList<PaginationModel> paginationModel = <PaginationModel>[].obs;

  RxBool isLoading = false.obs;

  RxInt perPage = 10.obs;

  RxInt currentPage = 1.obs;

  RxBool loadMoreData = true.obs;

  Future<void> getPaginationData() async {
    if (isLoading.value || !loadMoreData.value) return;

    isLoading.value = true;

    final Uri url = Uri.parse(
        'https://TechCrunch.com/wp-json/wp/v2/posts?context=embed&per_page=${perPage.value}&page=${currentPage.value}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData.isNotEmpty) {
          paginationModel.addAll(List<PaginationModel>.from(
              responseData.map((item) => PaginationModel.fromJson(item))));
          currentPage++;
        } else {
          loadMoreData.value = false;
        }
      } else {
        if (kDebugMode) {
          print("Error: ${response.statusCode} ${response.body}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _scrollListener() async {
    if (isLoading.value || !loadMoreData.value) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getPaginationData();
    }
  }
}
