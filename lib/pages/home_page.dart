import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // daftar barang
    final List<Item> items = [
      Item(name: 'Sugar', price: 5000),
      Item(name: 'Salt', price: 2000),
      Item(name: 'Coffee', price: 12000),
      Item(name: 'Rice', price: 10000),
      Item(name: 'Oil', price: 8000),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: InkWell(
              // aksi ketika item diklik
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('${item.name} - ${item.price}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
