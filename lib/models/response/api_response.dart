class ApiResponse {
  int? status;
  String? message;
  dynamic data;

  ApiResponse({this.status, this.message, this.data});

  ApiResponse copy({int? status, String? message, dynamic data}) => ApiResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data);
}
