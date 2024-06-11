import 'dart:async';
import 'package:coffeemerce/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:coffeemerce/themes.dart';

class SignUpPage extends StatelessWidget {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    Future<void> handleSignUp() async {
      try {
        final String fullName = nameController.text;
        final String username = usernameController.text;
        final String email = emailController.text;
        final String password = passwordController.text;

        // Check if all fields are not empty
        if (fullName.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty) {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text("All fields are required."),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        // Start a timer
        Timer timeout = Timer(Duration(seconds: 10), () {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text("Sign-up process timed out. Please try again later."),
              backgroundColor: Colors.red,
            ),
          );
        });

        // Call the sign-up method from the auth provider
        await authProvider.signUp(
          fullName: fullName,
          username: username,
          email: email,
          password: password,
        );

        // Cancel the timer as the sign-up process is complete
        timeout.cancel();

        // Navigate to home or any desired screen after successful sign-up
        Navigator.pushNamed(context, '/home');
      } catch (error) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: coffee,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: defaultMargin),
                    child: Text(
                      'Sign Up',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Register and Happy Shopping!',
                    style: primaryTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextField(
                        style: inputTextStyle,
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
                          hintStyle: inputTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextField(
                        style: inputTextStyle,
                        controller: usernameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Username',
                          hintStyle: inputTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextField(
                        style: inputTextStyle,
                        controller: emailController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: inputTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    
    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextField(
                        style: inputTextStyle,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: inputTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 75, vertical: defaultMargin),
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
            backgroundColor: submit,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: primaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, '/sign-in');
              },
              child: Text(
                'Sign In',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: blue,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                nameInput(),
                usernameInput(),
                emailInput(),
                passwordInput(),
                signUpButton(),
                footer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
