import 'package:hive/hive.dart';


part 'product_entity.g.dart';
@HiveType(typeId: 0)
class ProductEntity extends HiveObject {
  @HiveField(0)
  final String productTitle;
  @HiveField(1)
  final String productImage;
  @HiveField(2)
  final num productPrice;
  @HiveField(3)
  final num productRating;

  ProductEntity(
      {required this.productTitle,
      required this.productImage,
      required this.productPrice,
      required this.productRating});
}
