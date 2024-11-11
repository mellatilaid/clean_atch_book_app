import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/products_cubit/products_cubit.dart';

class AllProductsBlocBuilder extends StatelessWidget {
  const AllProductsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsFailure) {
          return Center(
            child: Text(
              state.errMessage,
            ),
          );
        }
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductsSuccuss) {
          return const AllProductsListView();
        } else {
          return const Center(
            child: Text('oops something went wrong  '),
          );
        }
      },
    );
  }
}
