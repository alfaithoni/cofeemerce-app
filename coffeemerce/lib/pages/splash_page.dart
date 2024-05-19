import 'dart:async';

import 'package:coffeemerce/themes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/sign-in'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coffee,
      body: Center(
        child: Container(
          width: 330,
          height: 350,
          decoration: BoxDecoration(
            image:
              DecorationImage(image: AssetImage('assets/coffeemerce.png'))),
      )),
    );
  }
}
