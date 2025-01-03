// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DropdownBtn extends StatefulWidget {
//   const DropdownBtn({super.key});

//   @override
//   State<DropdownBtn> createState() => _DropdownBtnState();
// }

// class _DropdownBtnState extends State<DropdownBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder(
//         init: controller,
//         builder: (controller) {
//           return DropdownButtonHideUnderline(
//             child: DropdownButton2<String>(
//               isExpanded: true,
//               hint: Text(
//                 "Account Type",
//                 // style: AppFontStyle.text_14_400(AppColors.darkText),
//               ),
//               items: controller.items
//                   .map((String item) => DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(
//                           item,
//                           // style: AppFontStyle.text_14_400(AppColors.darkText),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ))
//                   .toList(),
//               value: controller.selectedValue?.value,
//               onChanged: (String? value) {
//                 if (value != null) {
//                   controller.selectedValue?.value = value;
//                   controller.update(); // Notify GetBuilder to rebuild
//                 }
//               },
//               buttonStyleData: ButtonStyleData(
//                 height: 50,
//                 padding: const EdgeInsets.only(left: 14, right: 14),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(
//                       // color: AppColors.textFieldBorder,
//                       ),
//                 ),
//               ),
//               iconStyleData: IconStyleData(
//                 icon: const Icon(Icons.keyboard_arrow_down),
//                 iconSize: 25,
//                 // iconEnabledColor: AppColors.black,
//                 iconDisabledColor: Colors.grey,
//               ),
//               dropdownStyleData: DropdownStyleData(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 offset: const Offset(0, -1),
//                 scrollbarTheme: ScrollbarThemeData(
//                   radius: const Radius.circular(40),
//                   thickness: WidgetStateProperty.all<double>(6),
//                   thumbVisibility: WidgetStateProperty.all<bool>(true),
//                 ),
//               ),
//               menuItemStyleData: const MenuItemStyleData(
//                 height: 40,
//                 padding: EdgeInsets.only(left: 14, right: 14),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class DropdownController extends GetxController {
//   List<String> items = ["Type A", "Type B", "Type C"];

//   Rx<String?> selectedValue = Rx<String?>(null);

//   @override
//   void onInit() {
//     super.onInit();
//     selectedValue.value = items.first;
//   }

//   void updateSelectedValue(String? value) {
//     if (value != null) {
//       selectedValue.value = value;
//       update();
//     }
//   }
// }
