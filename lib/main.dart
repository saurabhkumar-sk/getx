import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prac/all_pages.dart';
import 'package:getx_prac/bottombar.dart';
import 'package:getx_prac/chart.dart';
import 'package:getx_prac/chart1.dart';
import 'package:getx_prac/home.dart';
import 'package:getx_prac/match_cards.dart/match_card.dart';
import 'package:getx_prac/pagination/pagination_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavBarExample(),
    );
  }
}
