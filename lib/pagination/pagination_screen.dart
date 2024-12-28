import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_prac/pagination/pagination_controller.dart';

class PaginationScreen extends StatelessWidget {
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PaginationController controller = Get.put(PaginationController());

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: const Text("Pagination Screen"),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.paginationModel.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.paginationModel.isEmpty) {
          return const Center(child: Text("No posts available"));
        }

        return SizedBox(
          height: 100,
          // width: 500,
          child: PageView.builder(
            // scrollDirection: Axis.horizontal,
            controller: controller.scrollController,
            itemCount: controller.paginationModel.length + 1,
            itemBuilder: (context, index) {
              if (index == controller.paginationModel.length) {
                return controller.isLoading.value
                    ? const Padding(
                        padding: EdgeInsets.all(5),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const SizedBox.shrink();
              }

              final post = controller.paginationModel[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(post.title['rendered'] ?? 'No title'),
                  subtitle: Text(post.date ?? 'No date'),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
