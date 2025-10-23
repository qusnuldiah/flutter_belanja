import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    // menerima data yang dikirim dari halaman sebelumnya
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: Center(child: Text('${itemArgs.name} with ${itemArgs.price}')),
    );
  }
}
