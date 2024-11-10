part of 'products_categories_cubit.dart';

@immutable
sealed class ProductsCategoriesState {}

final class ProductsCategoriesInitial extends ProductsCategoriesState {}

final class ProductsCategoriesLoading extends ProductsCategoriesState {}

final class ProductsCategoriesFailure extends ProductsCategoriesState {
  final String errMessage;
  ProductsCategoriesFailure({required this.errMessage});
}

final class ProductsCategoriesSuccuss extends ProductsCategoriesState {
  final List<ProductEntity> products;
  ProductsCategoriesSuccuss({required this.products});
}
