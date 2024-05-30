import "package:coffeemerce/themes.dart";
import "package:flutter/material.dart";

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: coffee,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: primaryTextColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: primaryTextColor,
            ),
          ),
        ],
      );
    }

    Widget nameInput(){
      return Container(
        margin: EdgeInsets.only(top: 30,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: homeTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Your new name?',
                hintStyle: homeTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: coffee,
                  )
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget usernameInput(){
      return Container(
        margin: EdgeInsets.only(top: 30,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: homeTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Your new username?',
                hintStyle: homeTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: coffee,
                  )
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top: 30,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: homeTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Your new email?',
                hintStyle: homeTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: coffee,
                  )
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/image_profile.png'))
              ),
            ),
          nameInput(),
          usernameInput(),
          emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: coffee2,
      appBar: header() as PreferredSizeWidget?,
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
