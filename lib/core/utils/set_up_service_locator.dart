import 'package:bookly/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setUPServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(dio: Dio()));
}
