import 'package:flutter/material.dart';
import 'package:week_10/product_card.dart';

class DataSearch extends SearchDelegate {
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
    {"name": "iPad Air", "price": 599.00, "category": "Tablets", "rating": 4.7},
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
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('res');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // List productNames = products.map((product) => product['name']).toList();
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8),
          child: InkWell(
            child: Text(
              "${products[index]['name']}",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: ProductCard(
                      name: products[index]['name'],
                      price: products[index]['price'].toString(),
                      category: products[index]['category'],
                      rating: products[index]['rating'].toString(),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
