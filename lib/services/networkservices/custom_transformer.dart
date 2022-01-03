
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';

class CustomTransformer extends Transformer {
  @override
  Future<String> transformRequest(RequestOptions options) async {
    if (kDebugMode) {
      print("Transformer transformRequest(): ===> ${options.path}");
    }
    var data = options.data ?? '';
    if (data is! String) {
      if (_isJsonMime(options.contentType)) {
        return json.encode(options.data);
      } else if (data is Map) {
        options.contentType =
            options.contentType ?? Headers.formUrlEncodedContentType;
        return Transformer.urlEncodeMap(data);
      }
    }
    return data.toString();
  }

  @override
  Future transformResponse(RequestOptions options, ResponseBody response) async {
    if (kDebugMode) {
      print("Transformer transformResponse() ===> ${response.statusCode}");
    }
    return response;
  }

  bool _isJsonMime(String? contentType) {
    if (contentType == null) return false;
    return MediaType.parse(contentType).mimeType ==
        Headers.jsonMimeType.mimeType;
  }

}