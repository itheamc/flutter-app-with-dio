import 'package:flutter_app_with_dio/models/response/api_response.dart';
import 'package:flutter_app_with_dio/models/users/user.dart';
import 'package:flutter_app_with_dio/services/networkservices/network_service.dart';

class UserRepository {
  late NetworkService _networkService;

  UserRepository.initialize() {
    _networkService = NetworkService.initialize();
  }

  Future<ApiResponse> users() async {
    final response = await _networkService.fetchUsers();
    if (response.status == null || response.status != 200) return response;
    final data = response.data;
    final posts = data.map((json) => User.fromJson(json));
    return response.copy(data: posts.toList());
  }
}