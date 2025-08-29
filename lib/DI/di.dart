import 'package:ar_menu_app/Features/MenuItem/data/datasource/menu_item_datasource.dart';
import 'package:ar_menu_app/Features/MenuItem/data/repository/menu_item_repository.dart';
import 'package:ar_menu_app/NetworkUtil/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getInInit() async {
  locator.registerSingleton<Dio>(DioProvider.createDio());

  //Datasource

  locator.registerFactory<IMenuItemDatasource>(
      () => MenuItemRemoteDatasource(locator.get()));

  //Repository

  locator.registerFactory<IMenuItemRepository>(
      () => MenuItemRepository(locator.get()));
}
