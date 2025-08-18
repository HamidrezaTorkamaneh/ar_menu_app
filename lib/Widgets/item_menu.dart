import 'package:ar_menu_app/Constants/color_constants.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  Color backgroundColor;
  String text;
  String image;
  ItemMenu(
      {super.key,
      required this.backgroundColor,
      required this.text,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -10,
            child: Image.asset(image, width: 150, height: 150),
          ),
          Positioned(
              bottom: 5,
              child: Column(
                children: [
                  Text(text,
                      style: const TextStyle(
                        color: CustomColor.secondaryTextColor,
                        fontSize: 20,
                        fontFamily: 'Tir',
                      )),
                  const Text('Menu',
                      style: TextStyle(
                        color: CustomColor.secondaryTextColor,
                        fontSize: 20,
                        fontFamily: 'Tir',
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
