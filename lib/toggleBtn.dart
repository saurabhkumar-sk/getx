import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

class ToggleBtn extends StatelessWidget {
  ToggleBtn({super.key});
  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Obx(
                      () => AdvancedSwitch(
                        width: 55,
                        controller:
                            ValueNotifier(controller.isToggleList[index].value),
                        borderRadius: BorderRadius.circular(18),
                        onChanged: (value) {
                          controller.isToggleList[index].value = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(controller.days[index]),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Obx(
                    () => Text(
                      controller.isToggleList[index].value
                          ? "Opened"
                          : "Closed",
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: controller.days.length,
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  // Days of the week
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  // List of toggle states for each day using RxBool
  final RxList<RxBool> isToggleList = List.generate(7, (_) => false.obs).obs;
}
