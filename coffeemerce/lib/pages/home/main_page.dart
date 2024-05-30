import 'package:coffeemerce/pages/home/cart_page.dart';
import 'package:coffeemerce/pages/home/home_page.dart';
import 'package:coffeemerce/pages/home/profile_page.dart';
import 'package:coffeemerce/pages/home/wishlist_page.dart';
import 'package:coffeemerce/themes.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // PageProvider pageProvider = Provider.of<PageProvider>(context);
    

    Widget customBottomNav() {
      return BottomNavigationBar(
        backgroundColor: backgroundColor1,
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 20,),
              child: Image.asset(
              'assets/icon_home.png',
              width: 21,
              color: currentIndex == 0 ? Color(0xFFE7D6C2):primaryTextColor,
            ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 20,),
              child: Image.asset(
              'assets/icon_wishlist.png',
              width: 21,
              color: currentIndex == 1 ? Color(0xFFE7D6C2):primaryTextColor,
            ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.asset(
              'assets/icon_cart.png',
              width: 21,
              color: currentIndex == 2 ? Color(0xFFE7D6C2):primaryTextColor,
            ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 20,),
              child: Image.asset(
              'assets/icon_profile.png',
              width: 21,
              color: currentIndex == 3 ? Color(0xFFE7D6C2):primaryTextColor,
            ),
            ),
            label: '',
          ),
        ],
      );
    }

    Widget body(){
      switch (currentIndex) {
        case 0:
          return HomePage();
          // break;
        case 1:
          return WishlistPage();
          // break;
        case 2:
          return CartPage();
          // break;
        case 3:
          return ProfilePage();
          // break;
        default:
          return HomePage();
      }
  };

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
