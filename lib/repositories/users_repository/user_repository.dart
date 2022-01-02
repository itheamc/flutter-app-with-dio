import 'package:flutter_app_with_dio/models/response/api_response.dart';
import 'package:flutter_app_with_dio/services/networkservices/network_service.dart';

class UserRepository {
  late NetworkService _networkService;

  UserRepository.initialize() {
    _networkService = NetworkService.initialize();
  }

  Future<ApiResponse> users() async {
    return await _networkService.fetchUsers();
  }
}