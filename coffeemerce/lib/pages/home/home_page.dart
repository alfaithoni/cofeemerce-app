import 'package:coffeemerce/themes.dart';
import 'package:flutter/material.dart';
import '../home/product.dart'; // Assuming Product model is defined in product.dart
import '../widgets/product_tile.dart';

class HomePage extends StatefulWidget {
  final List<Product> products;

  HomePage({required this.products});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTypesIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  'Welcome to Cofeemerce!',
                  style: homeTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget types() {
      List<String> coffeeTypes = [
        'All Beans',
        'Arabica',
        'Robusta',
      ];

      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              ...coffeeTypes.asMap().entries.map((entry) {
                int index = entry.key;
                String type = entry.value;
                bool isSelected = index == currentTypesIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTypesIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected ? coffee : Colors.transparent,
                      border: Border.all(
                        color: coffee,
                      ),
                    ),
                    child: Text(
                      type,
                      style: isSelected
                          ? primaryTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: medium,
                            )
                          : homeTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: medium,
                            ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      );
    }

    Widget body() {
      List<Product> filteredProducts = [];

      if (currentTypesIndex == 0) {
        filteredProducts = widget.products;
      } else {
        String selectedCategory = ['All Beans', 'Arabica', 'Robusta'][currentTypesIndex];
        filteredProducts = widget.products.where((product) => product.category == selectedCategory).toList();
      }

      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: filteredProducts.map((product) => ProductTile(product: product)).toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        types(),
        body(),
      ],
    );
  }
}
