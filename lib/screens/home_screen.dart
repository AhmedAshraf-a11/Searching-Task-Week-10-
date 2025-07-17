import 'package:flutter/material.dart';
import 'package:week_10/product_card.dart';
import 'package:week_10/screens/search_screen.dart';
import 'package:week_10/search_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {
        "name": "MacBook Pro",
        "price": 1299.99,
        "category": "Laptops",
        "rating": 4.8,
      },
      {
        "name": "Samsung Galaxy S24",
        "price": 799.99,
        "category": "Smartphones",
        "rating": 4.7,
      },
      {
        "name": "Sony WH-1000XM5",
        "price": 399.99,
        "category": "Headphones",
        "rating": 4.6,
      },
      {
        "name": "iPad Air",
        "price": 599.00,
        "category": "Tablets",
        "rating": 4.7,
      },
      {
        "name": "Apple Watch Series 9",
        "price": 399.00,
        "category": "Wearables",
        "rating": 4.5,
      },
      {
        "name": "Amazon Kindle Paperwhite",
        "price": 139.99,
        "category": "E-Readers",
        "rating": 4.6,
      },
      {
        "name": "Google Nest Hub",
        "price": 89.99,
        "category": "Smart Home",
        "rating": 4.4,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
          icon: Icon(Icons.search),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            name: products[index]['name'],
            price: products[index]['price'].toString(),
            category: products[index]['category'],
            rating: products[index]['rating'].toString(),
          );
        },
      ),
    );
  }
}
