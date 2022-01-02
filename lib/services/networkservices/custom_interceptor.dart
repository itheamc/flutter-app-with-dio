import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("NetworkInterceptor_OnError: ${err.response}");
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("NetworkInterceptor_OnRequest: ${options.path}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("NetworkInterceptor_OnResponse: ${response.statusMessage}");
    handler.next(response);
  }
}
