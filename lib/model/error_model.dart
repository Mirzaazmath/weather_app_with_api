// Error Model
class ErrorResponseModel {
  dynamic message;

  ErrorResponseModel({
    required this.message,
  });

  ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('message')) {
      message = json['message'];
    }
    if (json.containsKey('non_field_errors')) {
      message = json['non_field_errors'].toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
