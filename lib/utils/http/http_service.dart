import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:bankly_task/utils/http/response_handler.dart';

class HttpService {
  final String _baseUrl;

  HttpService(this._baseUrl);
  String get baseUrl => _baseUrl;

  Future<dynamic> get(String path) async {
    final String url = baseUrl + path;
    log('Request::URL: $url');
    final response = await http
        .get(
          Uri.parse(url),
          headers: await getHeaders(),
        )
        .timeout(const Duration(seconds: 40));
    return handleResponse(response);
  }

  Future<dynamic> post(String path, Map<dynamic, dynamic> body) async {
    final String url = baseUrl + path;
    log('URL:: $url, body:: ${json.encode(body)}');

    final response = await http
        .post(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 40));
    log(response.toString());
    return handleResponse(response);
  }

  Future<dynamic> patch(String path, Map<dynamic, dynamic> body) async {
    final String url = _baseUrl + path;
    log('URL:: $url, body:: ${json.encode(body)}');

    final response = await http
        .patch(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 40));
    return handleResponse(response);
  }

  Future<dynamic> put(String path, Map<dynamic, dynamic> body) async {
    final String url = _baseUrl + path;
    log('URL:: $url, body:: ${json.encode(body)}');

    final response = await http
        .put(Uri.parse(url),
            headers: await getHeaders(), body: json.encode(body))
        .timeout(const Duration(seconds: 40));

    return handleResponse(response);
  }

  Future<dynamic> delete(String path) async {
    final String url = _baseUrl + path;
    log('URL:: $url body:: $path');

    final response = await http
        .delete(
          Uri.parse(url),
          headers: await getHeaders(),
        )
        .timeout(const Duration(seconds: 40));

    return handleResponse(response);
  }

  getHeaders() async {
   //print('token $accessToken');
    return <String, String>{
      'Content-Type': 'application/json',
    };
  }
}
