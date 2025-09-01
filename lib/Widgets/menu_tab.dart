import 'package:ar_menu_app/DI/di.dart';
import 'package:ar_menu_app/Features/MenuItem/bloc/menu_item_bloc.dart';
import 'package:ar_menu_app/Widgets/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuTab extends StatelessWidget {
  final String type;
  final String category;

  const MenuTab({super.key, required this.type, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = MenuItemBloc(locator.get());
        bloc.add(MenuItemGetInitializedData(type: type, category: category));
        return bloc;
      },
      child: BlocBuilder<MenuItemBloc, MenuItemState>(
        builder: (context, state) {
          if (state is MenuItemLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MenuItemRequestSuccessState) {
            return state.getMenu!.fold(
              (error) => Center(child: Text(error)),
              (items) => ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => MenuList(items[index]),
              ),
            );
          }

          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
