import 'package:coffeemerce/themes.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

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
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/coffeebeans.png',
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
                    'Arabica',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    'Beans Gayo Arabica 1kg',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    'Rp 189.000,00',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}