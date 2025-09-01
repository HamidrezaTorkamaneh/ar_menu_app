part of 'menu_item_bloc.dart';

@immutable
sealed class MenuItemEvent {}

class MenuItemGetInitializedData extends MenuItemEvent {
  final String category;
  final String type;
  MenuItemGetInitializedData({required this.type,required this. category});
}
