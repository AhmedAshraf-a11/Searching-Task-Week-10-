import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String category;
  final String rating;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.category,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
            const SizedBox(height: 4),
            Text("Category: $category"),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                Text(rating, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
