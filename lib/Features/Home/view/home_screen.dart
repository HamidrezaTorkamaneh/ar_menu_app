import 'package:ar_menu_app/Constants/color_constants.dart';
import 'package:ar_menu_app/Widgets/item_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to',
              style: TextStyle(
                color: CustomColor.primaryTextColor,
                fontSize: 25,
                fontFamily: 'Tir',
              ),
            ),
            const Text(
              'AR Menu',
              style: TextStyle(
                color: CustomColor.primaryTextColor,
                fontSize: 45,
                fontFamily: 'Tir',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemMenu(
                  backgroundColor: Color.fromARGB(255, 74, 85, 48),
                  text: 'Cafe',
                  image: 'assets/images/cafe.png',
                ),
                SizedBox(width: 10),
                ItemMenu(
                  backgroundColor: const Color.fromARGB(255, 116, 30, 30),
                  text: 'Restaurant',
                  image: 'assets/images/restaurant.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
