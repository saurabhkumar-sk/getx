import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  var sortOption = 'Latest'.obs;
  List<Map<String, dynamic>> reviews = [
    {
      'title': 'McMushroom Pizza',
      'size': 'Medium',
      'description':
          'Lorem Ipsum has been the industry\'s standard dummy text...',
      'user': 'Ronald Richards',
      'rating': 4.0,
      'image': 'assets/pizza.jpg',
      'profile': 'assets/profile.jpg'
    },
  ];
}

// ProductReviewsScreen class
class ProductReviewsScreen extends StatelessWidget {
  final ReviewController controller = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text('Product Reviews'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomDropDown(
            controller: controller,
            hintText: "Select sorting option",
            items: controller.reviews.isEmpty
                ? ['Latest', 'Oldest', 'Highest', 'Lowest']
                : ['Latest', 'Oldest'],
            selectedValue: controller.sortOption.value,
            onChanged: (String? newValue) {
              controller.sortOption.value = newValue ?? 'Latest';
            },
          ),
        ],
      ),
    );
  }
}

// CustomDropDown Widget class
class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    required this.controller,
    this.selectedValue,
    this.hintText,
    this.items,
    this.onChanged,
  }) : super(key: key);

  final GetxController controller;
  final String? selectedValue;
  final String? hintText;
  final List<String>? items;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: selectedValue,
        hint: Text(
          hintText ?? '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        items: items!
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 40,
          width: 140,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            size: 20,
            color: Colors.black,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 150,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 35,
          padding: EdgeInsets.symmetric(horizontal: 14),
        ),
      ),
    );
  }
}

class DropdownController extends GetxController {
  final List<String> statusOptions = ['Cancelled', 'Completed', 'Pending'];
  Rx<String?> selectedValue = Rx<String?>(null);

  void updateSelectedValue(String? value) {
    selectedValue.value = value;
    update();
  }
}
