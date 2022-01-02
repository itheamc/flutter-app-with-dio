import 'dart:convert';

import 'package:flutter_app_with_dio/models/posts/post.dart';
import 'package:flutter_app_with_dio/models/response/api_response.dart';
import 'package:flutter_app_with_dio/services/networkservices/network_service.dart';

class PostRepository {
  late NetworkService _networkService;

  PostRepository.initialize() {
    _networkService = NetworkService.initialize();
  }

  Future<ApiResponse> posts() async {
    final response = await _networkService.fetchPosts();
    if (response.status == null || response.status != 200) return response;
    final data = response.data;
    final posts = data.map((json) => Post.fromJson(json));
    return response.copy(data: posts.toList());
  }
}
