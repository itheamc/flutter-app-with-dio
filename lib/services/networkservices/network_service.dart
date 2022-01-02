import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_with_dio/models/response/api_response.dart';
import 'package:flutter_app_with_dio/services/networkservices/api_constants.dart';
import 'package:flutter_app_with_dio/services/networkservices/custom_interceptor.dart';
import 'package:flutter_app_with_dio/services/networkservices/request_handlers.dart';

class NetworkService with RequestHandlers {
  late Dio _dio;

  NetworkService.initialize() {
    final options = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(options)..interceptors.add(NetworkInterceptor());
  }

  @override
  Future<ApiResponse> fetchPosts(
      {void Function(int count, int total)? onReceiveProgress}) async {
    try {
      final response =
          await _dio.get(postsPath, onReceiveProgress: onReceiveProgress);
      return ApiResponse(
          status: response.statusCode,
          message: response.statusMessage,
          data: response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse(
        message: "IO Error Occurred!!",
      );
    }
  }

  @override
  Future<ApiResponse> fetchUsers(
      {void Function(int count, int total)? onReceiveProgress}) async {
    try {
      final response =
          await _dio.get(usersPath, onReceiveProgress: onReceiveProgress);
      return ApiResponse(
          status: response.statusCode,
          message: response.statusMessage,
          data: response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return ApiResponse(
        message: "IO Error Occurred!!",
      );
    }
  }
}
