import 'package:dio/dio.dart';

class DioHelper{

  static late Dio dio;
  static init()
  {
        dio =Dio(
          BaseOptions(
            baseUrl: 'https://magdsoft.ahmedshawky.fun/api/',
            receiveDataWhenStatusError: true,
            headers: {
              'Accept': 'application/json',

            },
          )
        );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.post(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,

  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${  ''}',
      };
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}