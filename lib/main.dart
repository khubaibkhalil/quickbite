import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quickbite/firebase_options.dart';

import 'screens/AdminLogin.dart';
import 'screens/Dashboard.dart';
import 'screens/checkout_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/promotions_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/productlist_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuickBite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // Define routes
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/admin':(context) => AdminLogin(),
        '/dashboard':(context) => DashboardPage(),
        '/menu': (context) => RestaurantMenuScreen(),
        '/settings': (context) => SettingsScreen(),
        '/promotions': (context) => PromotionsScreen(),
        '/productlist':(context) => ProductListScreen(),
        '/checkout': (context) {
          final Map<String, dynamic> product =
              ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
          return CheckoutScreen(
            product: product,
            quantity: 1, // Set your default quantity here or get it from user input
          );
        },
      },
    );
  }
}