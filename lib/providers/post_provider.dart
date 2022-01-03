import 'package:flutter/foundation.dart';
import 'package:flutter_app_with_dio/models/response/api_response.dart';
import 'package:flutter_app_with_dio/repositories/posts_repository/post_repository.dart';

class PostProvider with ChangeNotifier {
  ApiResponse? _response;
  ApiResponse? get response => _response;
  bool _fetching = false;

  PostProvider() {
    load();
  }

  Future<void> _fetch() async {
    _response = await PostRepository.initialize().posts();
    if (hasListeners) notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    _fetching = false;
  }


  Future<void> load() async {
    if (!_fetching) {
      _fetching = true;
      final _temp = _response;
      if (_response != null) _response = null;
      if (_temp != _response && hasListeners) {
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 500));
      }

      await _fetch();
      return;
    }

    if (kDebugMode) {
      print("Wait...Fetching request was already made!!");
    }
  }

  Future<void> refresh() async {
    if (!_fetching) {
      _fetching = true;
      await Future.delayed(const Duration(milliseconds: 500));
      await _fetch();
    }
  }
}
