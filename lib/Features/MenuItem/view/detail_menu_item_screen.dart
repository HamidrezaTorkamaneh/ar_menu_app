import 'package:ar_menu_app/Constants/color_constants.dart';
import 'package:ar_menu_app/Features/MenuItem/data/model/menu_item.dart';
import 'package:ar_menu_app/Widgets/chached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailMenuItemScreen extends StatelessWidget {
  final MenuItem menuItem;
  const DetailMenuItemScreen(this.menuItem, {super.key});

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
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          menuItem.category,
          style: TextStyle(
            color: CustomColor.backgroundColor,
            fontSize: 25,
            fontFamily: 'Tir',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff47281b),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: CustomColor.backgroundColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 50, 30, 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage('assets/images/Table.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: CachedImage(
                      imageUrl: menuItem.image,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                menuItem.name,
                style: TextStyle(
                  color: CustomColor.primaryTextColor,
                  fontSize: 45,
                  fontFamily: 'Tir',
                ),
              ),
              SizedBox(height: 10),
              Text(
                menuItem.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColor.primaryTextColor,
                  fontSize: 20,
                ),
                softWrap: true,
              ),
              SizedBox(height: 15),
              Text(
                '\$${menuItem.price.toString()}',
                style: TextStyle(
                  color: CustomColor.primaryTextColor,
                  fontSize: 30,
                  fontFamily: 'Tir',
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffefd5b0)),
                    child: Center(
                      child: Text(
                        'View in AR',
                        style: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: 23,
                          fontFamily: 'Tir',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff66250e)),
                    child: Center(
                      child: Text(
                        'Order',
                        style: TextStyle(
                          color: CustomColor.backgroundColor,
                          fontSize: 23,
                          fontFamily: 'Tir',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
