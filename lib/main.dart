import 'package:ar_menu_app/DI/di.dart';
import 'package:ar_menu_app/Features/MenuItem/view/menu_item_screen.dart';

import 'package:flutter/material.dart';

void main() async {
  await getInInit();
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
      home: const MenuItemScreen(),
    );
  }
}
