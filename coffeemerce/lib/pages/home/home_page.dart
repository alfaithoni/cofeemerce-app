import 'package:coffeemerce/pages/widgets/product_tile.dart';
import 'package:coffeemerce/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTypesIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> coffeeTypes = [
      'All Beans',
      'Arabica',
      'Robusta',
      'Gayo',
      'Toraja',
      'Flores',
      'Kintamani'
    ];

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

    Widget bodyArabica(){
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: [
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
          ],
        ),
      );
    }
    
    return ListView(
      children: [
        header(),
        types(),
        bodyArabica(),
      ],
    );
  }
}
