import 'package:bookly/Features/home/domain/entities/product_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../constants.dart';

abstract class HomeLocalDataSourse {
  List<String> fetchProductsCategories();
  List<ProductEntity> fetchProducts();
}

class HomeLocalDataSourseImp extends HomeLocalDataSourse {
  @override
  List<ProductEntity> fetchProducts() {
    var box = Hive.box<ProductEntity>(kProductsBox);
    return box.values.toList();
  }

  @override
  List<String> fetchProductsCategories() {
    // TODO: implement fetchProductsCategories
    throw UnimplementedError();
  }
}
