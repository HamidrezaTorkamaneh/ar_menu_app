part of 'menu_item_bloc.dart';

@immutable
sealed class MenuItemState {}

final class MenuItemInitialState extends MenuItemState {}

class MenuItemRequestSuccessState extends MenuItemState {
  Either<String, List<MenuItem>>? cafeMenu;
  Either<String, List<MenuItem>>? restaurantMenu;

  MenuItemRequestSuccessState({this.cafeMenu, this.restaurantMenu});
}

class MenuItemLoadingState extends MenuItemState {}
