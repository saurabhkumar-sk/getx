import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prac/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExploreController controller = ExploreController();

  @override
  void initState() {
    controller.getExploreData(controller.searchController.value.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      value: controller.selectedType.value,
                      items: controller.dropDownValue.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          controller.updateDropDown(val);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: 220,
                  height: 60, // Adjust height to fit content better
                  child: Obx(
                    () => TextFormField(
                      controller: controller.searchController.value,
                      // onChanged: (value) {
                      //   controller.onSearch(value);
                      // },
                      decoration: InputDecoration(
                        labelText: "Search",
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.getExploreData(
                                controller.searchController.value.text);
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final data = controller.exploreModel.value?.data ?? [];
                  return (controller.exploreModel.value?.data?.isEmpty ?? false)
                      ? const Text("No Data widget")
                      : GridView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            var user = data[index].userDetail;
                            var images = user?.images;
                            return images != null && images.isNotEmpty
                                ? Image.network(images.first.toString())
                                : const Center(
                                    child: CircularProgressIndicator());
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
