import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prac/DropdownBtn.dart';
import 'package:getx_prac/dropdown_filter.dart';
import 'package:getx_prac/home.dart';
import 'package:getx_prac/listfilter.dart';
import 'package:getx_prac/match_cards.dart/match_card.dart';
import 'package:getx_prac/pagination/pagination_screen.dart';
import 'package:getx_prac/producr_review.dart';
import 'package:getx_prac/restaurant_details.dart';
import 'package:getx_prac/toggleBtn.dart';

class AllPages extends StatelessWidget {
  const AllPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Screens"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(const HomeScreen());
              },
              child: const Text("Search functionality"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(const PaginationScreen());
            },
            child: const Text("Pagination"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(const MatchCard());
            },
            child: const Text("MatchCard"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(ToggleBtn());
            },
            child: const Text("ToggleBtn"),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Get.to(DropdownDesignPage());
          //   },
          //   child: const Text("ProductListPage"),
          // ),
          ElevatedButton(
            onPressed: () {
              Get.to(ProductListPage());
            },
            child: const Text("ProductListPage"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(ProductReviewsScreens());
            },
            child: const Text("ProductReviewsScreen"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(RestaurantDetailsScreen());
            },
            child: const Text("RestaurantDetailsScreen"),
          ),
        ],
      ),
    );
  }
}
