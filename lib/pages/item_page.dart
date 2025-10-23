import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Hero(
            tag: item.name,
            child: Image.asset(
              item.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text('Harga: Rp ${item.price}', style: const TextStyle(fontSize: 18)),
          Text(
            'Stok: ${item.stock}',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber),
              Text('${item.rating}/5.0'),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text('Kembali ke Daftar'),
          ),
        ],
      ),
    );
  }
}
