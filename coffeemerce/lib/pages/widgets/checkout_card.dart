import 'package:coffeemerce/themes.dart';
import 'package:flutter/material.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: coffee2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(
                  'assets/coffeebeans.png',
                ),
              ),
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
                  'Beans Gayo Arabika 1kg',
                  style: homeTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Rp 189.000,00',
                  style:
                      homeTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
          SizedBox(width: 12,),
          Text(
            '2 items',style: homeTextStyle,
          )
        ],
      ),
    );
  }
}
