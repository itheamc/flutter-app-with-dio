import 'package:flutter_app_with_dio/models/response/api_response.dart';

mixin RequestHandlers {
  Future<ApiResponse> fetchPosts({void Function (int count, int total)? onReceiveProgress});

  Future<ApiResponse> fetchUsers({void Function (int count, int total)? onReceiveProgress});
}