import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/add_item.dart';
import 'package:shopify/admin_login.dart';
import 'package:shopify/cart/cart_provider.dart';
import 'package:shopify/login.dart';
import 'package:shopify/pages/bottom_nav.dart';
import 'package:shopify/pages/home.dart';
import 'package:shopify/pages/onboarding.dart';
import 'package:shopify/details/heaphone_detail.dart';
import 'package:shopify/product/headphone.dart';
import 'package:shopify/product/laptop.dart';
import 'package:shopify/product/tv.dart';
import 'package:shopify/product/watch.dart';
import 'package:shopify/signup.dart';
import 'package:shopify/widget/theme_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopify',
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: singup(),
    );
  }
}
