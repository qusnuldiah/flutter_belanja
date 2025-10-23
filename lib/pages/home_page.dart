import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
        name: 'Sugar',
        price: 5000,
        image: 'assets/sugar.jpg',
        stock: 10,
        rating: 4.5,
      ),
      Item(
        name: 'Salt',
        price: 2000,
        image: 'assets/salt.jpg',
        stock: 20,
        rating: 4.0,
      ),
      Item(
        name: 'Coffee',
        price: 12000,
        image: 'assets/coffee.jpg',
        stock: 5,
        rating: 5.0,
      ),
      Item(
        name: 'Rice',
        price: 10000,
        image: 'assets/rice.jpg',
        stock: 8,
        rating: 4.8,
      ),
      Item(
        name: 'Oil',
        price: 8000,
        image: 'assets/oil.jpg',
        stock: 15,
        rating: 4.3,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Hero(
                      tag: item.name,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text('Rp ${item.price}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            Text(item.rating.toString()),
                          ],
                        ),
                        Text('Stok: ${item.stock}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.all(12),
        child: const Text(
          'Dibuat oleh: Qusnul Diah (2341760035)',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
