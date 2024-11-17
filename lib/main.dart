import 'package:flutter/material.dart';
import 'package:product_catalog/view/home_view/ProductProvider.dart';
import 'package:product_catalog/view/login_view/loginprovider.dart';
import 'package:product_catalog/view/login_view/loginview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()), // Login provider
        ChangeNotifierProvider(create: (_) => ProductProvider()), // Product provider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Abezee', // Use custom font globally
      ),
      home: Loginview(), // Replace with your HomeView once login is successful
    );
  }
}
