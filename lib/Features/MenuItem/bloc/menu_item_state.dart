part of 'menu_item_bloc.dart';

@immutable
sealed class MenuItemState {}

final class MenuItemInitialState extends MenuItemState {}

class MenuItemRequestSuccessState extends MenuItemState {
  Either<String, List<MenuItem>>? getMenu;

  MenuItemRequestSuccessState({this.getMenu});
}

class MenuItemLoadingState extends MenuItemState {}
