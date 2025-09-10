import 'package:ar_menu_app/Constants/color_constants.dart';
import 'package:ar_menu_app/Features/MenuItem/data/model/menu_item.dart';
import 'package:ar_menu_app/Features/MenuItem/view/detail_menu_item_screen.dart';
import 'package:ar_menu_app/Widgets/chached_network_image.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  final MenuItem menuItem;
  const MenuList(this.menuItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailMenuItemScreen(menuItem),
            ),
          );
        },
        hoverColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xfffff6e2),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Table.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(child: CachedImage(imageUrl: menuItem.image)),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuItem.name,
                        style: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: 18,
                          fontFamily: 'Tir',
                        ),
                      ),
                      Text(
                        '\$${menuItem.price.toString()}',
                        style: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: 18,
                          fontFamily: 'Tir',
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: Image.asset('assets/images/Star.png'),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            menuItem.rate.toString(),
                            style: TextStyle(
                              color: CustomColor.primaryTextColor,
                              fontSize: 16,
                              fontFamily: 'Tir',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 10),
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff585722),
                ),
                child: const Center(
                  child: Text(
                    'View in AR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Tir',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
