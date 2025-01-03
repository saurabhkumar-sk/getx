import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  RestaurantDetailsScreen({super.key});
  final RestaurantDetails controller = Get.put(RestaurantDetails());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: GestureDetector(
                    onTap: () {
                      controller.pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RestaurantDetails extends GetxController {
  File? image;

  void pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    update();
  }
}
