import "package:coffeemerce/pages/widgets/cart_card.dart";
import "package:coffeemerce/themes.dart";
import "package:flutter/material.dart";

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: homeTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your Cart is Empty!',
              style: homeTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite coffee beans!',
              style: homeTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          CartCard(),
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        color: coffee,
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text(
                  'Rp 378.000,00',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: coffee2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Checkout',
                  style: homeTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header() as PreferredSizeWidget?,
      body: Stack(
        children: [
          emptyCart(),
          // content(),
          Align(
            alignment: Alignment.bottomCenter,
            // child: customBottomNav(),
          ),
        ],
      ),
    );
  }
}
