import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bankly_task/core/models/error_model.dart';
import 'package:bankly_task/core/models/success_model.dart';

handleResponse(http.Response response) {
  try {
    if (kDebugMode) {
      print(
          'ResponseCode:: ${response.statusCode},   ResponseBody:: ${response.body}');
    }
    final int code = response.statusCode;

    if (code == 200 || code == 201) {
      final dynamic body = json.decode(response.body);
      return SuccessModel(body);
    } else {
      final dynamic body = json.decode(response.body);
      return ErrorModel(body['message']);
    }
  } catch (e) {
    if (kDebugMode) {
      print("${e}error from model");
    }
    return ErrorModel('Request failed');
  }
}
