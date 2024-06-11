import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffeemerce/models/user_models.dart';
import '../../providers/auth_providers.dart' as local_auth; // Alias for your AuthProvider
import 'package:coffeemerce/themes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    local_auth.AuthProvider authProvider = Provider.of<local_auth.AuthProvider>(context); // Use the alias
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    void handleLogout() async {
      try {
        if (await authProvider.signOut()) {
          navigator.pushNamedAndRemoveUntil('/sign-in', (route) => false);
        }
      } catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ));
      }
    }

    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return Scaffold(
        body: Center(
          child: Text('User not logged in'),
        ),
      );
    }

    final Stream<DocumentSnapshot<Map<String, dynamic>>> userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .snapshots();

    Widget header() {
      return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: coffee,
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(
              child: Text('User data not available'),
            );
          }

          var userData = snapshot.data!.data()!;
          UserModel? user = UserModel.fromJson(userData);

          String fullName = user.fullName;
          String username = user.username;

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
                            fullName,
                            style: homeTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                          ),
                          Text(
                            '@$username',
                            style: homeTextStyle.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: handleLogout,
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
        },
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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(context, '/admin-panel');
              //   },
              //   child: menuItem('Sell your coffeebeans'),
              // ),
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

    return Scaffold(
      body: Column(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
