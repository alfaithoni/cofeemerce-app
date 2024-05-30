import "package:coffeemerce/themes.dart";
import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: coffee2,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/image_profile.png',
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Asep Saepudin',
                        style: homeTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        '@sepasep',
                        style: homeTextStyle.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: Image.asset(
                    'assets/button_logout.png',
                    width: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: homeTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: coffee,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: homeTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');  
                },
                child: menuItem('Edit Profile'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/admin-panel');  
                },
                child: menuItem('Sell your coffeebeans'),
              ),
              
              menuItem('Help'),
              SizedBox(
                height: 20,
              ),
              Text(
                'General',
                style: homeTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
              menuItem('Privacy & Policy'),
              menuItem('Terms of Service'),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
