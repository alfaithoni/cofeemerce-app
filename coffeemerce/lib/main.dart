import 'package:coffeemerce/providers/auth_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'package:coffeemerce/pages/admin_page.dart';
import 'package:coffeemerce/pages/checkout_page.dart';
import 'package:coffeemerce/pages/checkout_succes_page.dart';
import 'package:coffeemerce/pages/edit_profile_page.dart';
import 'package:coffeemerce/pages/home/cart_page.dart';
import 'package:coffeemerce/pages/home/main_page.dart';
import 'package:coffeemerce/pages/product_pages.dart';
import 'package:coffeemerce/pages/sign_in_page.dart';
import 'package:coffeemerce/pages/sign_up_page.dart';
import 'package:coffeemerce/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPages(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
        '/admin-panel': (context) => AdminPage(),
      },
      ),
    );
  }
}