import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffeemerce/themes.dart';
import 'package:flutter/material.dart';

class ProductPages extends StatefulWidget {
  @override
  State<ProductPages> createState() => _ProductPagesState();
}

class _ProductPagesState extends State<ProductPages> {
  List images = [
    'assets/coffeebeans.png',
    'assets/coffeebeans.png',
    'assets/coffeebeans.png',
  ];

  int currentIndex = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSucccesDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: coffee2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: coffee,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_succes.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: homeTextStyle.copyWith(
                      fontWeight: semiBold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed:(){},
                      style: TextButton.styleFrom(
                        backgroundColor: coffee,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? coffee : coffee2,
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: coffee,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: coffee,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map((image) => Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: coffee,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Beans Gayo Arabica 1kg', //nama
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Arabica', //category
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishlist = !isWishlist;
                      });
                      if (isWishlist) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: success,
                            content: Text(
                              'Has been added to your Wishlist!',
                              style: inputTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: fail,
                            content: Text(
                              'Has been removed from your Wishlist!',
                              style: primaryTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      isWishlist
                          ? 'assets/button_wishlist_true.png'
                          : 'assets/button_wishlist.png',
                      width: 46,
                      height: 46,
                    ),
                  ),
                ],
              ),
            ),
            //NOTE: Price
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: coffee2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga (bisa ditawar)',
                    // 'Harga (tawar ±Rp 10.000,00)',
                    style: homeTextStyle,
                  ),
                  Text(
                    'Rp 189.000,00', //price
                    style: homeTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),

            //NOTE: Desc
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  //description
                  Text(
                    '(Light / 1kg) Cocok untuk manual brew via pour-over / drip / v60 yang menghasilkan rasa dan aroma yang lembut, fruity dan acidic, tanpa pahit sedikitpun. Suitable for manual brew via pour-over / drip / v60 for soft, fruity and acidic with zero bitterness.',
                    style: primaryTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '(Medium Dark / 1kg) Cocok untuk penyeduhan apapun termasuk espresso dan tubruk yang menghasilkan rasa dan aroma yang bold, aromatic dengan keasaman yang hampir nol. Suitable for any brewing method including espresso and tubruk coffee for bold, aromatic taste and aroma with very less to zero acidity.',
                    style: primaryTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            //NOTE: Buttons
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    height: 54,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Tawar Harga',
                        style: primaryTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          showSucccesDialog();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: coffee2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: homeTextStyle.copyWith(fontWeight: semiBold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryTextColor,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
