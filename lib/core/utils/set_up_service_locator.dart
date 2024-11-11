import 'package:bookly/Features/home/data/data_sourses/home_remote_data_sourse.dart';
import 'package:bookly/Features/home/domain/user_cases/fetch_products_use_case.dart';
import 'package:bookly/core/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/home/data/data_sourses/home_local_data_sourse.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/domain/repos/home_repo.dart';

final getit = GetIt.instance;

void setUPServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getit.registerSingleton<HomeRepo>(HomeRepoImpl(
      homeRemoteDataSourse: HomeRemoteDataSourseImp(),
      homeLocalDataSourse: HomeLocalDataSourseImp()));

  getit.registerSingleton<FetchProductsUseCase>(
      FetchProductsUseCase(getit.get<HomeRepo>()));
}
