import 'package:coffeemerce/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for NumberFormat
import '../home/product.dart'; // Assuming Product model is defined in product.dart

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: coffee,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                product.image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    product.name,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(product.price),
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
