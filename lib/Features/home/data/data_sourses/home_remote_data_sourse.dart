import 'package:bookly/Features/home/data/models/product_model/product_model.dart';
import 'package:bookly/Features/home/domain/entities/product_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/core/utils/set_up_service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDataSourse {
  Future<List<String>> fetchProductsCategories();
  Future<List<ProductEntity>> fetchProducts();
}

class HomeRemoteDataSourseImp extends HomeRemoteDataSourse {
  final ApiService _apiService = getit.get<ApiService>();
  @override
  Future<List<String>> fetchProductsCategories() async {
    var data = await _apiService.get(endPoint: 'categories');
    final List<String> categories = [];

    for (var category in data) {
      categories.add(category);
    }
    return categories;
  }

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    var data = await _apiService.get(endPoint: 'products');
    final List<ProductEntity> products = [];
    for (var element in data) {
      products.add(ProductModel.fromJson(element));
    }

    addAllProducts(products);

    return products;
  }

  void addAllProducts(List<ProductEntity> products) {
    final Box box = Hive.box<ProductEntity>(kProductsBox);
    box.addAll(products);
  }
}
