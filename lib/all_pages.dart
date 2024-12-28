import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prac/home.dart';
import 'package:getx_prac/match_cards.dart/match_card.dart';
import 'package:getx_prac/pagination/pagination_screen.dart';

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
        ],
      ),
    );
  }
}
