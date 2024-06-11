import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_providers.dart';
import 'package:coffeemerce/themes.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    void handleSignIn() async {
      try {
        // Check if email and password are not empty
        if (emailController.text.isEmpty || passwordController.text.isEmpty) {
          scaffoldMessenger.showSnackBar(SnackBar(
            content: Text("Please enter your email and password."),
            backgroundColor: Colors.red,
          ));
          return;
        }

        // Start a timer
        Timer timeout = Timer(Duration(seconds: 10), () {
          // If the sign-in process doesn't complete within 10 seconds, show an error message
          scaffoldMessenger.showSnackBar(SnackBar(
            content: Text("Sign-in process timed out. Please try again later."),
            backgroundColor: Colors.red,
          ));
        });

        bool signInSuccess = await authProvider.signIn(
          email: emailController.text,
          password: passwordController.text,
        );

        // Cancel the timer as the sign-in process is complete
        timeout.cancel();

        if (!signInSuccess) {
          scaffoldMessenger.showSnackBar(SnackBar(
            content: Text("Invalid email or password."),
            backgroundColor: Colors.red,
          ));
        } else {
          // Navigate to the home page and remove all previous routes from the stack
          navigator.pushNamedAndRemoveUntil('/home', (route) => false);
        }
      } catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ));
      }
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
                logo(),
                emailInput(),
                passwordInput(),
                signInButton(handleSignIn),
                footer(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: coffee,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
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
                    'Sign In',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Sign In to Continue',
                  style: primaryTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Container(
          width: 150,
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffeemerce.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
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
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: primaryTextColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 4),
                  Expanded(
                    child: TextFormField(
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
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: primaryTextColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 4),
                  Expanded(
                    child: TextFormField(
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

  Widget signInButton(Function() onPressed) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 75, vertical: defaultMargin),
      child: TextButton(
        onPressed: onPressed as void Function(),
        style: TextButton.styleFrom(
          backgroundColor: submit,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Sign In',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  Widget footer(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account? ',
            style: primaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              'Sign Up',
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
}
