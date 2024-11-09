import 'package:bookly/Features/home/domain/entities/product_entity.dart';

abstract class HomeLocalDataSourse {
  List<String> fetchProductsCategories();
  List<ProductEntity> fetchProducts();
}

class HomeLocalDataSourseImp extends HomeLocalDataSourse {
  @override
  List<ProductEntity> fetchProducts() {
    // TODO: implement fetchProducts
    throw UnimplementedError();
  }

  @override
  List<String> fetchProductsCategories() {
    // TODO: implement fetchProductsCategories
    throw UnimplementedError();
  }
}
