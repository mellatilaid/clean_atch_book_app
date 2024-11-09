import 'package:bookly/Features/home/domain/entities/product_entity.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<String>>> fetchProductsCategories();
  Future<Either<Failures, List<ProductEntity>>> fetchProducts();
}
