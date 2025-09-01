import 'package:ar_menu_app/Features/MenuItem/data/model/menu_item.dart';
import 'package:ar_menu_app/Features/MenuItem/data/repository/menu_item_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'menu_item_event.dart';
part 'menu_item_state.dart';

class MenuItemBloc extends Bloc<MenuItemEvent, MenuItemState> {
  final IMenuItemRepository menuItemRepository;
  MenuItemBloc(this.menuItemRepository) : super(MenuItemInitialState()) {
    on<MenuItemGetInitializedData>((event, emit) async {
      emit(MenuItemLoadingState());

      var menuItemRestaurantList = await menuItemRepository.getMenu(
          type: event.type, category: event.category);

      emit(MenuItemRequestSuccessState(getMenu: menuItemRestaurantList));
    });
  }
}
