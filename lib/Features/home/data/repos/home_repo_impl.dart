import 'package:bookly/Features/home/data/data_sourses/home_local_data_sourse.dart';
import 'package:bookly/Features/home/data/data_sourses/home_remote_data_sourse.dart';
import 'package:bookly/Features/home/domain/entities/product_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSourse homeRemoteDataSourse;
  final HomeLocalDataSourse homeLocalDataSourse;

  HomeRepoImpl(
      {required this.homeRemoteDataSourse, required this.homeLocalDataSourse});
  @override
  Future<Either<Failures, List<ProductEntity>>> fetchProducts() async {
    try {
      final localProdcutsList = homeLocalDataSourse.fetchProducts();

      if (localProdcutsList.isNotEmpty) {
        return right(localProdcutsList);
      }
      final remoteProductList = await homeRemoteDataSourse.fetchProducts();
      return right(remoteProductList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<String>>> fetchProductsCategories() {
    // TODO: implement fetchProductsCategories
    throw UnimplementedError();
  }
}
