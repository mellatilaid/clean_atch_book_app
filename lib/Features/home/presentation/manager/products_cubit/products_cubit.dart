import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/product_entity.dart';
import 'package:bookly/Features/home/domain/user_cases/fetch_products_use_case.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.fetchProductsUseCase) : super(ProductsInitial());
  final FetchProductsUseCase fetchProductsUseCase;
  getProductsCategories() async {
    emit(ProductsLoading());

    final resault = await fetchProductsUseCase.call();
    resault.fold((failure) {
      emit(ProductsFailure(errMessage: failure.errMessage));
    }, (products) {
      emit(ProductsSuccuss(products: products));
    });
  }
}
