import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prac/match_cards.dart/controller.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MatchCardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('MatchCard'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 15.0),
                          controller: controller.leftScrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Obx(() {
                              return Container(
                                height: 250,
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 2,
                                    color:
                                        controller.leftHighlightedIndex.value ==
                                                index
                                            ? Colors.black
                                            : Colors.transparent,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    index.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 15.0),
                          controller: controller.rightScrollController,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Obx(() {
                              return Container(
                                height: 250,
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 2,
                                    color: controller
                                                .rightHighlightedIndex.value ==
                                            index
                                        ? Colors.black
                                        : Colors.transparent,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    index.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200,
            left: 135,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.shade100,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        title: const Text("Matched"),
                        content: Obx(
                          () => Text(
                              "${controller.leftSelectedItem.value}    ${controller.rightSelectedItem.value}"),
                        ),
                      );
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(30),
                  child: Icon(Icons.fingerprint),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
