import 'package:ar_menu_app/Constants/color_constants.dart';
import 'package:ar_menu_app/Features/MenuItem/view/cafe_menu_screen.dart';
import 'package:ar_menu_app/Features/MenuItem/view/restaurant_menu_screen.dart';
import 'package:ar_menu_app/Widgets/item_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColor.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: CustomColor.backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CafeMenuScreen()));
                  },
                  backgroundColor: CustomColor.greebColor,
                  text: 'Cafe',
                  image: 'assets/images/cafe.png',
                ),
                const SizedBox(width: 10),
                ItemMenu(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RestaurantMenuScreen()));
                  },
                  backgroundColor: CustomColor.redColor,
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
