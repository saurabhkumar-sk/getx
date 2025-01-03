import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DropdownButton2 Demo',
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];

          return ListTile(
            leading: CircleAvatar(
              child: Text(product.name[0]),
            ),
            title: Text(product.name),
            subtitle: Text(product.id),
            trailing: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                    ),
                  ),
                ];
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductController extends GetxController {
  RxList<Product> products = <Product>[
    Product(name: "McMushroom Pizza", id: "#1234567"),
    Product(name: "Pepperoni Pizza", id: "#1234568"),
    Product(name: "Veggie Pizza", id: "#1234569"),
  ].obs;
}

class Product {
  final String name;
  final String id;

  Product({
    required this.name,
    required this.id,
  });
}
