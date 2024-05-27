import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:so_po_dev/apps/controllers/home_controller.dart';
import 'package:so_po_dev/apps/screens/widgets/grid_item_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(20, (index) => "Item $index");
    return Scaffold(
      appBar: AppBar(title: const Text("HOME"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Horizontal space between grid items
            mainAxisSpacing: 10.0, // Vertical space between grid items
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GridItem(item: items[index]);
          },
        ),
      ),
    );
  }
}
