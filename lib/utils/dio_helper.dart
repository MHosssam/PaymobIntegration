import 'package:dio/dio.dart';
import 'package:paymob_integration/utils/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstant.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postDate(
      {required String url,
      required Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    return await dio.post(url, data: data, queryParameters: query);
  }
}
