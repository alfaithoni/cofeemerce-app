import "package:coffeemerce/themes.dart";
import "package:flutter/material.dart";

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: coffee,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/coffeemerce.png',
              width: 60,
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
                  'Beans Gayo Robusta 1kg',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text(
                  'Rp 189.000,00',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/button_wishlist.png',
            width: 34,
          )
        ],
      ),
    );
  }
}
