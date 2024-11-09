import 'package:bookly/Features/home/data/models/product_model/product_model.dart';
import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/core/utils/set_up_service_locator.dart';

abstract class HomeRemoteDataSourse {
  Future<List<String>> fetchProductsCategories();
  Future<List<ProductModel>> fetchProducts();
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
  Future<List<ProductModel>> fetchProducts() async {
    var data = await _apiService.get(endPoint: 'products');
    final List<ProductModel> products = [];
    for (var element in data) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }
}
