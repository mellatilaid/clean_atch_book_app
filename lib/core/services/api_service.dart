import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String _baseUrl = "https://fakestoreapi.com/products";

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final Response response = await dio.get('$_baseUrl/$endPoint');

    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, dynamic data, String? token}) async {
    Map<String, dynamic> headers = {};

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final Response response = await dio.post('$_baseUrl/$endPoint',
        data: data, options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint, dynamic data, String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final Response response = await dio.put('$_baseUrl/$endPoint',
        data: data, options: Options(headers: headers));
    return response.data;
  }
}
