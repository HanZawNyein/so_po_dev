import 'package:flutter/material.dart';
import 'package:so_po_dev/apps/screens/widgets/griditem_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
