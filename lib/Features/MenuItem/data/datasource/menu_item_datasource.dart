import 'package:ar_menu_app/Features/MenuItem/data/model/menu_item.dart';
import 'package:ar_menu_app/NetworkUtil/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IMenuItemDatasource {
  Future<List<MenuItem>> getMenu(
      {required String type, required String category});
}

class MenuItemRemoteDatasource extends IMenuItemDatasource {
  final Dio _dio;
  MenuItemRemoteDatasource(this._dio);

  @override
  Future<List<MenuItem>> getMenu(
      {required String type, required String category}) async {
    try {
      Map<String, dynamic> menuItemQuery = {
        'filter': 'type="$type" && category="$category"'
      };
      var response = await _dio.get('collections/menu_items/records',
          queryParameters: menuItemQuery);
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
