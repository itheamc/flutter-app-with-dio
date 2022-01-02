import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_with_dio/models/posts/post.dart';
import 'package:flutter_app_with_dio/models/users/user.dart';
import 'package:flutter_app_with_dio/services/networkservices/api_constants.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print("NetworkInterceptor_OnError: ${err.response}");
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print("NetworkInterceptor_OnRequest: ${options.path}");
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print("NetworkInterceptor_OnResponse: ${response.statusMessage}");
    }

    dynamic data;

    if (response.statusCode == 200) {
      final path = response.requestOptions.path;
      if (path == postsPath) {
        data = response.data.map((json) => Post.fromJson(json)).toList();
      } else {
        data = response.data.map((json) => User.fromJson(json)).toList();
      }
    }

    final modResponse = Response(
        data: data ?? response.data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        isRedirect: response.isRedirect,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        redirects: response.redirects,
        extra: response.extra);

    handler.next(modResponse);
  }
}
