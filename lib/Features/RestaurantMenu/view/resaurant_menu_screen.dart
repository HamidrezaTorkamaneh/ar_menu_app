import 'package:ar_menu_app/Constants/color_constants.dart';
import 'package:flutter/material.dart';

class RestaurantMenuScreen extends StatelessWidget {
  const RestaurantMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Restaurant Menu',
                style: TextStyle(
                  color: CustomColor.primaryTextColor,
                  fontSize: 35,
                  fontFamily: 'Tir',
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xfffff6e2),
                ),
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/Table.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/GrilledChicken.png',
                          width: 120,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grilled Chicken',
                          style: TextStyle(
                            color: CustomColor.primaryTextColor,
                            fontSize: 20,
                            fontFamily: 'Tir',
                          ),
                        ),
                        Text(
                          '\$12.00',
                          style: TextStyle(
                            color: CustomColor.primaryTextColor,
                            fontSize: 18,
                            fontFamily: 'Tir',
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              child: Image.asset('assets/images/Star.png'),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '3',
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
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff585722),
                      ),
                      child: Center(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
