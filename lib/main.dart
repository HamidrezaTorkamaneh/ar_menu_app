import 'package:ar_menu_app/Features/Home/view/home_screen.dart';
import 'package:ar_menu_app/Features/RestaurantMenu/view/resaurant_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const RestaurantMenuScreen(),
    );
  }
}
