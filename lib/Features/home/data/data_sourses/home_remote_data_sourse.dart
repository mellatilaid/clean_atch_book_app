import 'package:bookly/Features/home/data/models/book_model/product_model.dart';

abstract class HomeRemoteDataSourse {
  Future<List<ProductModel>> fetchFeaturedBooks();
  Future<List<ProductModel>> fetchNewestBooks();
}

class HomeRemoteDataSourseImp extends HomeRemoteDataSourse {
  @override
  Future<List<ProductModel>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
