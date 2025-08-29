import 'package:ar_menu_app/Features/MenuItem/data/datasource/menu_item_datasource.dart';
import 'package:ar_menu_app/Features/MenuItem/data/model/menu_item.dart';
import 'package:ar_menu_app/NetworkUtil/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IMenuItemRepository {
  Future<Either<String, List<MenuItem>>> getCafeMenu();
  Future<Either<String, List<MenuItem>>> getRestaurantMenu();
}

class MenuItemRepository extends IMenuItemRepository {
  final IMenuItemDatasource datasource;
  MenuItemRepository(this.datasource);

  @override
  Future<Either<String, List<MenuItem>>> getRestaurantMenu() async {
    try {
      var response = await datasource.getRestaurantMenu();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'There is no data');
    }
  }

  @override
  Future<Either<String, List<MenuItem>>> getCafeMenu() async {
    try {
      var response = await datasource.getCafeMenu();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'There is no data');
    }
  }
}
