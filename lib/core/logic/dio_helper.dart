import 'package:dio/dio.dart';

import 'cache_helper.dart';

class DioHelper {
  final _dio =
      Dio(BaseOptions(baseUrl: 'https://thimar.amr.aait-d.com/api/', headers: {
    'Accept': 'application/json',
    "Authorization": "Bearer ${CacheHelper.token}",
  }));

  Future<CustomResponse> getData({required String url}) async {
    try {
      final response = await _dio.get(url);
      print(response.data);

      return CustomResponse(isSuccess: true, data: response.data);
    } on DioException catch (e) {
      return handleException(e);
    }
  }

  Future<CustomResponse> send(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(url, data: data);
      print(response.data);
      return CustomResponse(isSuccess: true, data: response.data);
    } on DioException catch (e) {
      return handleException(e);
    }
  }

  CustomResponse handleException(DioException e) {
    print(e.response?.data);
    String? message = e.response?.data['message'];
    return CustomResponse(isSuccess: false, message: message ?? e.type.name);
  }
}

class CustomResponse {
  final bool isSuccess;
   String? message;
  final dynamic data;

  CustomResponse({required this.isSuccess, this.message, this.data}){
    message = message ?? data['message']??"failed try again later";
  }
}
