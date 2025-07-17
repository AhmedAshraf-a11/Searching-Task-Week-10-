import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:week_10/search_data.dart';
import 'package:week_10/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double _priceFilter = 1500;
  final DataSearch dataSearch = DataSearch();
  Map<String, dynamic>? _selectedProduct;
  @override
  Widget build(BuildContext context) {
    // Filter products by price
    List<Map<String, dynamic>> filteredProducts = dataSearch.products
        .where((product) => product['price'] <= _priceFilter)
        .toList();
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
      body: ListView(
        children: [
          DropdownSearch<String>(
            items: (f, cs) =>
                filteredProducts.map((p) => p['name'] as String).toList(),
            popupProps: PopupProps.menu(fit: FlexFit.loose),
            selectedItem: 'Select an Item',
            onChanged: (value) {
              final product = filteredProducts.firstWhere(
                (p) => p['name'] == value,
              );
              setState(() {
                _selectedProduct = product;
              });
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: product['name'],
                desc:
                    'Price: 24${product['price']}\nCategory: ${product['category']}\nRating: ${product['rating']}',
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(
                    name: product['name'],
                    price: product['price'].toString(),
                    category: product['category'],
                    rating: product['rating'].toString(),
                  ),
                ),
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              ).show();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Max Price: ${_priceFilter.toStringAsFixed(2)}'),
                Expanded(
                  child: Slider(
                    value: _priceFilter,
                    min: 0,
                    max: 1500,
                    divisions: 100,
                    label: _priceFilter.toStringAsFixed(2),
                    onChanged: (value) {
                      setState(() {
                        _priceFilter = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
