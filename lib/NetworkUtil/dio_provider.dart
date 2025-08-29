import 'package:ar_menu_app/Constants/string_constants.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static Dio createDio() {
    return Dio(BaseOptions(baseUrl: StringConstants.baseUrl));
  }
}
