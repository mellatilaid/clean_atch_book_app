import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'products_categories_state.dart';

class ProductsCategoriesCubit extends Cubit<ProductsCategoriesState> {
  ProductsCategoriesCubit() : super(ProductsCategoriesInitial());
}
