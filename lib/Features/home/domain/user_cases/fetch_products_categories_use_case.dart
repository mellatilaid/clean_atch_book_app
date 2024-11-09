import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/use_case.dart';

class FetchProductsCategoriesUseCase extends UseCase<List<String>, NoParam> {
  final HomeRepo homeRepo;

  FetchProductsCategoriesUseCase({required this.homeRepo});

  @override
  Future<Either<Failures, List<String>>> call([NoParam? param]) async {
    // TODO: implement call
    return await homeRepo.fetchProductsCategories();
  }
}
