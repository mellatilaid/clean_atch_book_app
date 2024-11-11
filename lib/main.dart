import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/set_up_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Features/home/domain/entities/product_entity.dart';
import 'Features/home/domain/user_cases/fetch_products_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>(kProductsBox);
  setUPServiceLocator();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(FetchProductsUseCase(getit.get<HomeRepo>()))
            ..getProductsCategories(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
