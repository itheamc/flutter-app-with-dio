import 'package:flutter_app_with_dio/models/response/api_response.dart';
import 'package:flutter_app_with_dio/services/networkservices/network_service.dart';

class PostRepository {
  late NetworkService _networkService;

  PostRepository.initialize() {
    _networkService = NetworkService.initialize();
  }

  Future<ApiResponse> posts() async {
    return await _networkService.fetchPosts();
  }
}
