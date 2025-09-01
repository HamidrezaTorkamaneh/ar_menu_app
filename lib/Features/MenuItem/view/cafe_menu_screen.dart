import 'package:ar_menu_app/Constants/color_constants.dart';
import 'package:ar_menu_app/DI/di.dart';
import 'package:ar_menu_app/Features/MenuItem/bloc/menu_item_bloc.dart';
import 'package:ar_menu_app/Widgets/menu_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CafeMenuScreen extends StatefulWidget {
  const CafeMenuScreen({super.key});

  @override
  State<CafeMenuScreen> createState() => _CafeMenuScreenState();
}

class _CafeMenuScreenState extends State<CafeMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        MenuItemBloc menuItemBloc = MenuItemBloc(locator.get());
        menuItemBloc.add(MenuItemGetInitializedData(type: "", category: ""));
        return menuItemBloc;
      }),
      child: ViewContainer(),
    );
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColor.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: CustomColor.backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return BlocBuilder<MenuItemBloc, MenuItemState>(
      builder: ((context, state) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: CustomColor.backgroundColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 15),
                          child: Text(
                            'Cafe Menu',
                            style: TextStyle(
                              color: CustomColor.primaryTextColor,
                              fontSize: 35,
                              fontFamily: 'Tir',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: TabBar(
                        labelColor: CustomColor.primaryTextColor,
                        unselectedLabelColor: Colors.black38,
                        dividerColor: Colors.transparent,
                        indicatorWeight: 3,
                        labelStyle: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: 17,
                          fontFamily: 'Tir',
                        ),
                        indicatorColor: CustomColor.primaryTextColor,
                        tabs: const [
                          Tab(text: "Cake"),
                          Tab(text: "Shake"),
                          Tab(text: "Warm Drink"),
                          Tab(text: "Cold Drink"),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20),
                    ),
                    SliverFillRemaining(
                      child: TabBarView(
                        children: const [
                          MenuTab(type: "cafe", category: "cake"),
                          MenuTab(type: "cafe", category: "shake"),
                          MenuTab(type: "cafe", category: "warm_drink"),
                          MenuTab(type: "cafe", category: "cold_drink"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
