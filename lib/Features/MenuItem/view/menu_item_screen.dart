import 'package:ar_menu_app/Constants/color_constants.dart';
import 'package:ar_menu_app/DI/di.dart';
import 'package:ar_menu_app/Features/MenuItem/bloc/menu_item_bloc.dart';
import 'package:ar_menu_app/Widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemScreen extends StatefulWidget {
  const MenuItemScreen({super.key});

  @override
  State<MenuItemScreen> createState() => _MenuItemScreenState();
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        MenuItemBloc menuItemBloc = MenuItemBloc(locator.get());
        menuItemBloc.add(MenuItemGetInitializedData());
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
        return Scaffold(
          backgroundColor: CustomColor.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                slivers: [
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Restaurant Menu',
                        style: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: 35,
                          fontFamily: 'Tir',
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 30),
                  ),
                  if (state is MenuItemLoadingState) ...{
                    const SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  },
                  if (state is MenuItemRequestSuccessState) ...{
                    state.restaurantMenu!.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (restaurantMenu) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                            height: 700,
                            child: ListView.builder(
                                itemCount: restaurantMenu.length,
                                itemBuilder: (context, index) {
                                  return MenuList(restaurantMenu[index]);
                                })),
                      );
                    })
                  },
                  // if (state is MenuItemLoadingState) ...{
                  //   const SliverToBoxAdapter(
                  //     child: Center(
                  //       child: SizedBox(
                  //         height: 24,
                  //         width: 24,
                  //         child: CircularProgressIndicator(),
                  //       ),
                  //     ),
                  //   )
                  // },
                  // if (state is MenuItemRequestSuccessState) ...{
                  //   state.cafeMenu!.fold((l) {
                  //     return SliverToBoxAdapter(
                  //       child: Text(l),
                  //     );
                  //   }, (cafeMenu) {
                  //     return SliverToBoxAdapter(
                  //       child: SizedBox(
                  //           height: 300,
                  //           child: ListView.builder(
                  //               itemCount: cafeMenu.length,
                  //               itemBuilder: (context, index) {
                  //                 return MenuList(cafeMenu[index]);
                  //               })),
                  //     );
                  //   })
                  // }
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
