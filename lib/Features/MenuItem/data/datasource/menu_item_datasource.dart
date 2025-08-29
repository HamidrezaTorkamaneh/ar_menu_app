import 'package:ar_menu_app/Features/MenuItem/data/model/menu_item.dart';
import 'package:ar_menu_app/NetworkUtil/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IMenuItemDatasource {
  Future<List<MenuItem>> getCafeMenu();
  Future<List<MenuItem>> getRestaurantMenu();
}

class MenuItemRemoteDatasource extends IMenuItemDatasource {
  final Dio _dio;
  MenuItemRemoteDatasource(this._dio);

  @override
  Future<List<MenuItem>> getCafeMenu() async {
    try {
      var response = await _dio.get('collections/menu_items/records');
      return response.data['items']
          .map<MenuItem>((jsonObject) => MenuItem.fromJson(jsonObject))
          .toList();
    } on DioException catch (dioException) {
      throw ApiException(
          dioException.response?.statusCode ?? 0, dioException.message);
    } catch (ex) {
      throw ApiException(0, 'unknown');
    }
  }

  @override
  Future<List<MenuItem>> getRestaurantMenu() async {
    try {
      var response = await _dio.get('collections/menu_items/records');
      return response.data['items']
          .map<MenuItem>((jsonObject) => MenuItem.fromJson(jsonObject))
          .toList();
    } on DioException catch (dioException) {
      throw ApiException(
          dioException.response?.statusCode ?? 0, dioException.message);
    } catch (ex) {
      print("Parse error: $ex");
      throw ApiException(0, 'unknown');
    }
  }
}
